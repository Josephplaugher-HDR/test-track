//
// COPYRIGHT © 2024 Esri
//
// All rights reserved under the copyright laws of the United States
// and applicable international laws, treaties, and conventions.
//
// This material is licensed for use under the Esri Master
// Agreement (MA) and is bound by the terms and conditions
// of that agreement.
//
// You may redistribute and use this code without modification,
// provided you adhere to the terms and conditions of the MA
// and include this copyright notice.
//
// See use restrictions at http://www.esri.com/legal/pdfs/mla_e204_e300/english
//
// For additional information, contact:
// Environmental Systems Research Institute, Inc.
// Attn: Contracts and Legal Department
// 380 New York Street
// Redlands, California 92373
// USA
//
// email: legal@esri.com
//

part of '../../arcgis_maps.dart';

/// The class is responsible for handling HTTP requests made by the Maps SDK.
///
/// It also provides functionalities for caching management.
class ArcGISHttpClient {
  /// The HTTP [HttpCache] used for this client.
  HttpCache get cache => _httpCacheBuilder;

  /// Custom headers to be sent with every request.
  ///
  /// Usually, specify a `String` as the value. To send multiple headers of the same
  /// name, specify a `List<String>` as the value.
  Map<String, dynamic>? customHeaders;

  /// @nodoc
  @visibleForTesting
  CacheStore? get cacheStore {
    return _httpCacheBuilder.cacheStore;
  }

  /// Makes a GET request to the given [uri]. The [data] is passed in the body of
  /// the request as JSON.
  static Future<ResponseInfo> get(
    Uri uri, {
    Map<String, String>? data,
    RequestInfo? requestInfo,
  }) {
    return _fetch(HttpOperation.get, uri,
        parameters: data, requestInfo: requestInfo);
  }

  /// Makes a POST request to the given [uri]. The [data] is passed in the body of
  /// the request, using the content-type `application/x-www-form-urlencoded`.
  ///
  /// if [fileParts] is provided and not empty, the request will be sent as
  /// a multipart request.
  static Future<ResponseInfo> post(
    Uri uri, {
    Map<String, String>? data,
    List<FilePart>? fileParts,
    RequestInfo? requestInfo,
  }) {
    if (fileParts != null) {
      if (fileParts.isEmpty) {
        throw ArgumentError.value(
            fileParts, 'fileParts', 'fileParts must not be empty');
      }
      return _postMultiParts(uri, data, fileParts, requestInfo: requestInfo);
    }
    return _fetch(HttpOperation.post, uri,
        parameters: data, requestInfo: requestInfo);
  }

  // Sends a POST request with multiple parts to the given [uri].
  static Future<ResponseInfo> _postMultiParts(
    Uri uri,
    Map<String, String>? parameters,
    List<FilePart> fileParts, {
    RequestInfo? requestInfo,
  }) async {
    final formData =
        (parameters != null) ? FormData.fromMap(parameters) : FormData();

    // there are some issues to use other than MultipartFile.fromFile
    // see: https://github.com/cfug/dio/issues/781
    for (final filePart in fileParts) {
      formData.files.add(
        MapEntry(
          'files',
          await MultipartFile.fromFile(
            filePart.filePath,
            filename: filePart.filename ?? path.basename(filePart.filePath),
            contentType: (filePart.contentType != null)
                ? MediaType.parse(filePart.contentType!)
                : MediaType('application', 'octet-stream'),
          ),
        ),
      );
    }
    return _fetch(HttpOperation.multipartPost, uri,
        data: formData, requestInfo: requestInfo);
  }

  /// Downloads a file from the given [uri] to the [destinationFileUri]. The [data]
  /// is passed in the body of the request as JSON. Use [operation] to specify the
  /// HTTP verb as [HttpOperation.get] (default) or [HttpOperation.post].
  static Future<ResponseInfo> download(
    Uri uri,
    Uri destinationFileUri, {
    Map<String, String>? data,
    RequestInfo? requestInfo,
    HttpOperation operation = HttpOperation.get,
  }) async {
    if (operation != HttpOperation.get && operation != HttpOperation.post) {
      throw ArgumentError.value(operation, 'operation', 'Must be get or post');
    }

    final requestContext = _RequestContext(
      uri: uri,
      destinationFileUri: destinationFileUri,
      parameters: data,
      requestInfo: requestInfo,
      operation: operation,
      wantsResponseInfo: true,
    );

    await _sendFileRequest(
        requestContext: requestContext, destinationFileUri: destinationFileUri);

    return requestContext.responseInfo!;
  }

  /// @nodoc
  @visibleForTesting
  Interceptors get interceptorsForTesting => _dio.interceptors;

  static Future<ResponseInfo> _fetch(
    HttpOperation operation,
    Uri uri, {
    Object? data,
    Map<String, String>? parameters,
    RequestInfo? requestInfo,
  }) {
    final requestContext = _RequestContext(
      uri: uri,
      data: data,
      parameters: parameters,
      requestInfo: requestInfo,
      operation: operation,
      wantsResponseInfo: true,
    );
    return _sendRequest(
      requestContext: requestContext,
      authenticationMode: _ArcGISAuthenticationMode.allowed,
    ).then((response) => ResponseInfo._fromClientResponse(response));
  }

  ArcGISHttpClient._() {
    _httpCacheBuilder = _HttpCacheBuilder(_dio);
  }

  /// @nodoc
  @visibleForTesting
  static ArcGISHttpClient create() {
    return ArcGISHttpClient._();
  }

  static Future<_ClientResponse> _sendRequest({
    required _RequestContext requestContext,
    required _ArcGISAuthenticationMode authenticationMode,
  }) {
    final clientReference =
        _ClientReferenceManager.generateClientReferenceFromDartObject(
            requestContext);

    return _ClientRequestSender.sendRequest(
      requestUri: requestContext.uri,
      authenticationMode: authenticationMode,
      requestContext: clientReference,
    );
  }

  static Future<_ClientReference> _sendFileRequest({
    required _RequestContext requestContext,
    required Uri destinationFileUri,
  }) {
    final clientReference =
        _ClientReferenceManager.generateClientReferenceFromDartObject(
            requestContext);

    return _ClientRequestSender.sendFileRequest(
      requestUri: requestContext.uri,
      fileUri: destinationFileUri,
      requestContext: clientReference,
    );
  }

  Future<void> _requestRequired(_Request request) async {
    // Set up the default DbCacheStore or open it if already exists.
    if (_httpCacheBuilder.cacheStore == null && _httpCacheBuilder.enabled) {
      final appCacheDir = await getApplicationCacheDirectory();
      await _httpCacheBuilder.setPath(appCacheDir.uri);
    }

    final requestContext = request.requestContext?.requestContext ??
        _RequestContext(uri: request.uri);

    if (requestContext.cancelToken.isCancelled) {
      // client canceled before core could process the request
      _reportError(request: request, error: _userCanceledException);
      return;
    }

    final cancelRequestSubscription = request.onCancelRequest
        .listen((_) => requestContext.cancelToken.cancel('core'));
    _exitHandler.registerSubscription(cancelRequestSubscription);

    final response = await _initiateRequest(request, requestContext)
        .then<Response?>((response) => response)
        .catchError((e) {
      var error = (e is DioException && e.error != null) ? e.error! : e;

      if (e is DioException && e.type == DioExceptionType.cancel) {
        if (e.error == 'core') {
          // canceled by core -- no need to report
          return null;
        } else {
          // canceled by client
          error = _userCanceledException;
        }
      }

      _reportError(request: request, error: error);
      return null;
    });

    _exitHandler.unregisterSubscription(cancelRequestSubscription);
    await cancelRequestSubscription.cancel();

    if (response == null || request.canceled) return;

    Uint8List? data;
    if (response.data != null && response.data is List<int>) {
      data = Uint8List.fromList(response.data as List<int>);
    }

    var statusCode = response.statusCode ?? 0;
    if (statusCode == 304) {
      // was served from cache
      if (_cacheHitStreamController.hasListener) {
        _cacheHitStreamController.add(response.realUri);
      }
      statusCode = 200;
    }

    if (requestContext.wantsResponseInfo) {
      requestContext.responseInfo = ResponseInfo._(
        statusCode: statusCode,
        headers: response.headers,
      );
    }

    _reportSuccess(
      request: request,
      data: data,
      etag: response.headers.value('etag') ?? '',
      mediaType: response.headers.value(Headers.contentTypeHeader) ?? '',
      statusCode: statusCode,
    );
  }

  Future<Response> _initiateRequest(
      _Request request, _RequestContext requestContext) async {
    var uri = requestContext.uri;

    // If the original request was for an http url but core determined that it
    // must go over https, update the uri.
    if (uri.scheme != request.uri.scheme) {
      uri = uri.replace(scheme: request.uri.scheme);
    }

    var operation = requestContext.operation ?? request.httpOperation;
    if (operation == HttpOperation.get) {
      // Our services reject URLs longer than 2048 characters
      const urlLengthMaximum = 2048;
      final uriWithParameters =
          uri.appendingQueryParameters(request.parameters);
      if (uriWithParameters.toString().length >= urlLengthMaximum) {
        operation = HttpOperation.post;
      }
    }

    _userAgent ??= await UserAgent.userAgent();
    final headers = {
      ...request.headers,
      'User-Agent': _userAgent,
      ...?customHeaders,
      ...?requestContext.requestInfo?.headers,
    };

    ProgressCallback? dioReceiveProgress;
    final onReceiveProgress = requestContext.requestInfo?.onReceiveProgress;
    if (onReceiveProgress != null) {
      // convert dio's totalBytes (which can be -1) to our nullable totalBytes
      dioReceiveProgress = (int bytesReceived, int totalBytes) =>
          onReceiveProgress(bytesReceived, totalBytes >= 0 ? totalBytes : null);
    }

    // Inform the cache of the request so it can keep track of the cache size
    _httpCacheBuilder.incrementRequestCount();

    if (request._objectType == _RequestType.fileRequest &&
        requestContext.destinationFileUri != null) {
      return _dio.download(
        uri.appendingQueryParameters(request.parameters).toString(),
        requestContext.destinationFileUri!.toFilePath(),
        onReceiveProgress: dioReceiveProgress,
        cancelToken: requestContext.cancelToken,
        data: requestContext.parameters,
        options: Options(
          headers: headers,
          method:
              requestContext.operation == HttpOperation.post ? 'POST' : null,
        ),
      );
    }

    switch (operation) {
      case HttpOperation.get:
        return _dio.getUri<List<int>>(
          uri.appendingQueryParameters(request.parameters),
          onReceiveProgress: dioReceiveProgress,
          data: requestContext.parameters,
          cancelToken: requestContext.cancelToken,
          options: Options(
            headers: headers,
          ),
        );
      case HttpOperation.post:
        return _dio.postUri<List<int>>(
          uri,
          onReceiveProgress: dioReceiveProgress,
          cancelToken: requestContext.cancelToken,
          data: requestContext.parameters ?? request.parameters,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: headers,
          ),
        );
      case HttpOperation.rawPost:
        return _dio.postUri<List<int>>(
          uri,
          onReceiveProgress: dioReceiveProgress,
          cancelToken: requestContext.cancelToken,
          data: request.body,
          options: Options(
            contentType: request.contentType,
            headers: headers,
          ),
        );
      case HttpOperation.multipartPost:
        return _dio.postUri<List<int>>(
          uri,
          onReceiveProgress: dioReceiveProgress,
          cancelToken: requestContext.cancelToken,
          data: requestContext.data ?? request.asMultipartFormData,
          options: Options(
            contentType: request.contentType,
            headers: headers,
          ),
        );
      default:
        throw UnsupportedError('Unsupported operation: $operation');
    }
  }

  void _reportError({required _Request request, required Object error}) {
    final errorReference =
        _ClientReferenceManager.generateClientReferenceFromDartObject(error);
    request.handleResponseWithResponse(
      data: null,
      etag: '',
      mediaType: '',
      httpStatusCode: 0,
      platformApiError: errorReference,
      response: request.requestContext,
    );
  }

  void _reportSuccess({
    required _Request request,
    required Uint8List? data,
    required String etag,
    required String mediaType,
    required int statusCode,
  }) {
    if (request is _TileRequest && etag.isNotEmpty) {
      if (request.isNoDataTile) {
        _noDataTileEtags[request.uri.host] = etag;
      } else if (etag == _noDataTileEtags[request.uri.host]) {
        if (_responseTestController.hasListener) {
          _responseTestController.add(request.uri);
        }
        // If the etag matches the saved noDataEtag then tell core
        // that the response is a no data tile
        request.handleResponseNoDataTile();
        return;
      }
    } else if (request.isDataAlreadyCached && request.etag == etag) {
      if (_responseTestController.hasListener) {
        _responseTestController.add(request.uri);
      }
      // If the data is already cached and the etag matches, then
      // tell core that the response is a cache hit
      request.handleCachedResponse();
      return;
    }

    request.handleResponseWithResponse(
      data: data,
      etag: etag,
      mediaType: mediaType,
      httpStatusCode: statusCode,
      platformApiError: null,
      response: request.requestContext,
    );
  }

  final _dio = Dio(
    BaseOptions(
      responseType: ResponseType.bytes, // we want the raw bytes
      validateStatus: (_) => true, // we want to handle all status codes
    ),
  );

  late final _HttpCacheBuilder _httpCacheBuilder;

  static String? _userAgent;

  final _noDataTileEtags = HashMap<String, String>();

  final _cacheHitStreamController = StreamController<Uri>.broadcast();

  /// @nodoc
  @visibleForTesting
  Stream<Uri> get cacheHitStream => _cacheHitStreamController.stream;

  final _responseTestController = StreamController<Uri>.broadcast();

  /// @nodoc
  @visibleForTesting
  Stream<Uri> get responseTestStream => _responseTestController.stream;
}

/// A cache class to store HTTP responses and manage caching settings.
abstract class HttpCache {
  /// Whether caching is enabled. Defaults to true.
  bool get enabled;

  /// Enable or disable caching.
  Future<void> setEnabled(bool enabled);

  /// The cache size limit in bytes. Default is 100MB (100000000).
  /// It is possible that the size of the cache may temporarily exceed the size
  /// limit.
  int get maxCacheSize;
  set maxCacheSize(int maxCacheSize);

  /// The path to the cache store.
  Uri get path;

  /// Specify a custom Uri for the cache store.
  Future<void> setPath(Uri pathUri);

  /// Clears the cache.
  Future<void> evictAll();

  @visibleForTesting
  void setCheckCacheSizeCallback(void Function() callback);

  @visibleForTesting
  set cacheCheckRequestCount(int cacheCheckRequestCount);
}

/// A helper class for managing cache settings and operations for the
/// ArcGISHttpClient.
///
/// This class is responsible for enabling/disabling cache, setting the cache path,
/// setting the maximum number of entries in the cache, and clearing the cache.
///
/// It also builds the cache store and adds/removes the cache interceptor to/from Dio.
class _HttpCacheBuilder implements HttpCache {
  _HttpCacheBuilder(Dio dio) : _dio = dio;

  /// empty the backing store.
  @override
  Future<void> evictAll() {
    return cacheStore != null ? cacheStore!.clean() : Future.value();
  }

  /// rebuilds the cache store and adds the cache interceptor to Dio.
  Future<void> build() async {
    _dio.interceptors.remove(interceptor);
    if (enabled) {
      // always create a new cache store based on the current settings
      await cacheStore?.close();

      // Keep the cache database file under the max size
      _checkAndReduceCacheFileSize();

      cacheStore = DbCacheStore(databasePath: path.path, logStatements: false);

      // DbCacheStore starts an async "clean" operation in the constructor, but fails
      // to "await" it. This can cause a problem if the store is closed before the clean
      // operation is finished. To avoid this, we await a clean operation here.
      await cacheStore!.clean(staleOnly: true);

      final cacheOptions = CacheOptions(
        store: cacheStore,
        hitCacheOnErrorExcept: [401, 403],
      );
      interceptor = _ArcGISCacheInterceptor(options: cacheOptions);
      _dio.interceptors.add(interceptor!);
    } else {
      await cacheStore?.close();
      cacheStore = null;
      interceptor = null;
    }
  }

  var _maxCacheSize = 100000000;

  @override
  int get maxCacheSize => _maxCacheSize;

  @override
  set maxCacheSize(int maxCacheSize) {
    if (_maxCacheSize == maxCacheSize) return;

    _maxCacheSize = maxCacheSize;
    _checkAndReduceCacheFileSize();
  }

  var _cacheCheckRequestCount = 100;

  int get cacheCheckRequestCount => _cacheCheckRequestCount;

  @override
  set cacheCheckRequestCount(int cacheCheckRequestCount) {
    _cacheCheckRequestCount = cacheCheckRequestCount;
  }

  @override
  Uri path = Directory.systemTemp.uri;

  @override
  Future<void> setPath(Uri pathUri) {
    // rebuild only if the provided path is not the same as the current path and
    // the cache store is not null.
    if (pathUri.path == path.path && cacheStore != null) return Future.value();
    path = pathUri;
    return build();
  }

  @override
  bool enabled = true;

  @override
  Future<void> setEnabled(bool enabled) {
    if (this.enabled == enabled) return Future.value();
    this.enabled = enabled;
    return build();
  }

  // Keep a running count of requests. Once we get to cacheCheckRequestLimit,
  // check if the cache DB needs cleaning.
  void incrementRequestCount() {
    if (!enabled) return;

    requestCountForCacheCheck++;
    if (requestCountForCacheCheck > cacheCheckRequestCount) {
      requestCountForCacheCheck = 0;
      checkCacheSizeCallback?.call();
      _checkAndReduceCacheFileSize();
    }
  }

  @override
  void setCheckCacheSizeCallback(void Function() callback) {
    checkCacheSizeCallback = callback;
  }

  void _checkAndReduceCacheFileSize() {
    // Check the size of the actual DB file. This prevents us from rebuilding
    // the cache every time we check.
    final dbFilePath = '${path.path}${Platform.pathSeparator}dio_cache.db';
    final dbFile = File(dbFilePath);
    if (dbFile.existsSync()) {
      final fileSize = dbFile.lengthSync();
      if (fileSize > maxCacheSize * 0.9) {
        // Call the function to clean the cache if the file is too large
        return _cleanCache();
      }
    }
  }

  void _cleanCache() {
    // Open DB file
    final dbPath = '${path.path}${Platform.pathSeparator}dio_cache.db';
    if (!File(dbPath).existsSync()) {
      return;
    }
    sqlite.Database? db;
    try {
      db = sqlite.sqlite3.open(dbPath);

      const cacheDbTable = 'DioCache';
      const cacheKeyField = 'cacheKey';
      const contentField = 'content';
      const headersField = 'headers';
      const requestDateField = 'requestDate';

      // SELECT for summation of size of all content and header fields
      int cacheSize = 0;
      final sizeCheckResult = db.select(
          'SELECT SUM(length($contentField)) + SUM(length($headersField)) AS cacheSize FROM $cacheDbTable;');
      if (sizeCheckResult.isNotEmpty) {
        final theRow = sizeCheckResult.first;
        cacheSize = theRow['cacheSize'] as int;
      }

      // If cacheSize is >90% of maxCacheSize, reduce to <50% of maxCacheSize
      if (cacheSize > maxCacheSize * 0.9) {
        // Get the cache entries ordered by requestDate
        final cacheRows = db.select(
            'SELECT $cacheKeyField, length($contentField)+length($headersField) AS cacheEntrySize FROM $cacheDbTable ORDER BY $requestDateField;');
        final staleCacheKeys = <String>[];
        var runningTotal = 0;
        final deletionSizeTarget = cacheSize - (maxCacheSize * 0.5).floor();

        // Iterate through responses adding entry lengths until we get to desired size. Record cacheKey for each iteration
        for (final cacheRow in cacheRows) {
          final cacheEntrySize = cacheRow['cacheEntrySize'] as int;
          runningTotal = runningTotal + cacheEntrySize;
          staleCacheKeys.add('\'${cacheRow['cacheKey'] as String}\'');
          if (runningTotal > deletionSizeTarget) break;
        }

        // Delete cache entries with stale cacheKeys
        final staleCacheKeysString = staleCacheKeys.join(',');
        db.execute(
            'DELETE FROM $cacheDbTable WHERE $cacheKeyField IN ($staleCacheKeysString);');

        // VACUUM the DB to shrink the file
        db.execute('VACUUM;');
      }
    } on sqlite.SqliteException catch (e) {
      final expOperation = e.operation;
      final expMessage = e.message;
      final expCausingStatement = e.causingStatement;

      var errString = expMessage;
      if (expOperation != null) {
        errString = '$errString sqlite3 operation: $expOperation';
      }
      if (expCausingStatement != null) {
        errString = '$errString SQL statement: $expCausingStatement';
      }
      logger.e('Cache database operation failed. $errString');
    } catch (e) {
      logger.e('Cache database clean failed. $e');
    } finally {
      // Close the DB
      db?.dispose();
    }
  }

  late final Dio _dio;
  CacheStore? cacheStore;
  Interceptor? interceptor;
  var requestCountForCacheCheck = 0;

  void Function()? checkCacheSizeCallback;
}

/// Represents a file in a multipart request to upload.
class FilePart {
  FilePart(this.filePath, {this.filename, this.contentType});

  /// The path to the file to be uploaded.
  final String filePath;

  /// The filename of the file in the multipart request.
  /// If not specified, the filename from filePath will be used.
  final String? filename;

  /// The content type of the file in the multipart request, e.g. 'image/jpeg'.
  /// If not specified, 'application/octet-stream' will be used.
  final String? contentType;
}

extension on _RequestAttachment {
  MapEntry<String, MultipartFile> get asMultipartFileEntry {
    return MapEntry(
      parameterName,
      MultipartFile.fromBytes(
        data ?? List<int>.empty(),
        filename: fileName,
        contentType: MediaType.parse(contentType),
      ),
    );
  }
}

extension on _Request {
  FormData get asMultipartFormData {
    return FormData.fromMap(parameters)
      ..files.addAll(
          attachments.map((attachment) => attachment.asMultipartFileEntry));
  }
}
