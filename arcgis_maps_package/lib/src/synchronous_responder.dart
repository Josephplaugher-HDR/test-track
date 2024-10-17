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

part of '../arcgis_maps.dart';

class _SynchronousResponder {
  static void connectPlatformHelpersProvider(
    _PlatformHelpersProvider platformHelpersProvider,
    ffi.Pointer<ffi.Void> userData,
  ) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PlatformHelpersProvider_setApplicationLocaleCallback(
        platformHelpersProvider._handle,
        bindings.addresses.syncPlatformHelpersProvider_applicationLocale,
        userData,
        errorHandler,
      );
    });
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PlatformHelpersProvider_setConvertDateTimeCallback(
        platformHelpersProvider._handle,
        bindings.addresses.syncPlatformHelpersProvider_convertDateTime,
        userData,
        errorHandler,
      );
    });
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PlatformHelpersProvider_setConvertNumberCallback(
        platformHelpersProvider._handle,
        bindings.addresses.syncPlatformHelpersProvider_convertNumber,
        userData,
        errorHandler,
      );
    });
  }

  static void connectResourceProvider(
    _ResourceProvider resourceProvider,
    ffi.Pointer<ffi.Void> userData,
  ) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ResourceProvider_setGetResourceStringCallback(
        resourceProvider._handle,
        bindings.addresses.syncResourceProvider_getResourceString,
        userData,
        errorHandler,
      );
    });
  }

  static ReceivePort spawn({
    required String locale,
    required SendPort asynchronousSendPort,
    required ffi.Pointer<ffi.Void> relayUserData,
  }) {
    final options = <String, dynamic>{};

    if (SynchronousResponderTest.testLocale != null) {
      options['locale'] = SynchronousResponderTest.testLocale;
      options['testSendPort'] = SynchronousResponderTest.receivePort!.sendPort;
    } else {
      options['locale'] = locale;
    }
    options['asynchronousSendPort'] = asynchronousSendPort;
    options['relayUserData'] = relayUserData.address;

    final receivePort = ReceivePort();
    options['callbackSendPort'] = receivePort.sendPort;

    Isolate.spawn(_spawnEntryPoint, options);

    return receivePort;
  }

  static const _defaultLanguage = 'en';

  static void _spawnEntryPoint(Map<String, dynamic> options) {
    intl_date.initializeDateFormatting().then((_) {
      final callbackSendPort = options['callbackSendPort']! as SendPort;
      final locale = options['locale'] ?? _defaultLanguage;
      final asynchronousSendPort = options['asynchronousSendPort']! as SendPort;
      final relayUserData =
          ffi.Pointer<ffi.Void>.fromAddress(options['relayUserData']! as int);
      final testSendPort = options['testSendPort'] as SendPort?;

      _SynchronousResponder syncHandler;
      try {
        syncHandler = _SynchronousResponder(
          callbackSendPort,
          locale,
          asynchronousSendPort,
          relayUserData,
          testSendPort,
        );
      } catch (e) {
        // If any problem occurs, fall back to the default language.
        syncHandler = _SynchronousResponder(
          callbackSendPort,
          _defaultLanguage,
          asynchronousSendPort,
          relayUserData,
          testSendPort,
        );
      }

      syncHandler._startListening();
    });
  }

  final SendPort _callbackSendPort;
  final _callbackReceivePort = ReceivePort();
  String _locale;
  final SendPort _asynchronousSendPort;
  final ffi.Pointer<ffi.Void> _relayUserData;
  late String _dateSeparator;

  // Precomputed patterns for special date formats.
  final _patterns = <_DateTimeFormat, String>{};

  final SendPort? _testSendPort;
  final _syncReceivePort = ReceivePort();

  _SynchronousResponder(this._callbackSendPort, this._locale,
      this._asynchronousSendPort, this._relayUserData, this._testSendPort) {
    _setupLocale();
  }

  void _setupLocale() {
    // Find the first punctuation character in the date format to use as the date separator.
    final punctuationMatch = RegExp(r'[^\s\w\d]')
        .firstMatch(intl.DateFormat.yMd(_locale).pattern ?? '');
    _dateSeparator = punctuationMatch?.group(0) ?? '/';

    // Precompute some patterns that have special formatting.
    _patterns[_DateTimeFormat.dayShortMonthYear] =
        intl.DateFormat.yMMMd(_locale).pattern ?? 'd MMM yyyy';
    _patterns[_DateTimeFormat.longDate] =
        intl.DateFormat.yMMMMEEEEd(_locale).pattern ?? 'EEEE, MMMM d, yyyy';
    _patterns[_DateTimeFormat.longMonthDayYear] =
        intl.DateFormat.yMMMMd(_locale).pattern ?? 'MMMM d, yyyy';
    _patterns[_DateTimeFormat.longMonthYear] =
        intl.DateFormat.yMMMM(_locale).pattern ?? 'MMMM yyyy';
    _patterns[_DateTimeFormat.shortDate] =
        intl.DateFormat.yMd(_locale).pattern ?? 'M/d/yyyy';
    _patterns[_DateTimeFormat.shortDateLe] =
        intl.DateFormat('d/M/yyyy').pattern!;
    _patterns[_DateTimeFormat.shortDateLeLongTime] =
        intl.DateFormat('d/M/yyyy h:mm:ss a').pattern!;
    _patterns[_DateTimeFormat.shortDateLeLongTime24] =
        intl.DateFormat('d/M/yyyy HH:mm:ss').pattern!;
    _patterns[_DateTimeFormat.shortDateLeShortTime] =
        intl.DateFormat('d/M/yyyy h:mm a').pattern!;
    _patterns[_DateTimeFormat.shortDateLeShortTime24] =
        intl.DateFormat('d/M/yyyy HH:mm').pattern!;
    _patterns[_DateTimeFormat.shortDateLongTime] =
        intl.DateFormat.yMd(_locale).add_jms().pattern ?? 'M/d/yyyy h:mm:ss a';
    _patterns[_DateTimeFormat.shortDateLongTime24] =
        intl.DateFormat.yMd(_locale).add_Hms().pattern ?? 'M/d/yyyy HH:mm:ss';
    _patterns[_DateTimeFormat.shortDateShortTime] =
        intl.DateFormat.yMd(_locale).add_jm().pattern ?? 'M/d/yyyy h:mm a';
    _patterns[_DateTimeFormat.shortDateShortTime24] =
        intl.DateFormat.yMd(_locale).add_Hm().pattern ?? 'M/d/yyyy HH:mm';
    _patterns[_DateTimeFormat.shortMonthYear] =
        intl.DateFormat.yMMM(_locale).pattern ?? 'MMM yyyy';
    _patterns[_DateTimeFormat.year] =
        intl.DateFormat.y(_locale).pattern ?? 'yyyy';
    _patterns[_DateTimeFormat.longTime] =
        intl.DateFormat.jms(_locale).pattern ?? 'h:mm:ss';
    _patterns[_DateTimeFormat.shortTime] =
        intl.DateFormat.jm(_locale).pattern ?? 'h:mm a';
    _patterns[_DateTimeFormat.dayShortMonthYearLongTime] =
        intl.DateFormat.yMMMd(_locale).add_jms().pattern ??
            'd MMM yyyy h:mm:ss a';
    _patterns[_DateTimeFormat.dayShortMonthYearLongTime24] =
        intl.DateFormat.yMMMd(_locale).add_Hms().pattern ??
            'd MMM yyyy HH:mm:ss';
    _patterns[_DateTimeFormat.dayShortMonthYearShortTime] =
        intl.DateFormat.yMMMd(_locale).add_jm().pattern ?? 'd MMM yyyy h:mm a';
    _patterns[_DateTimeFormat.dayShortMonthYearShortTime24] =
        intl.DateFormat.yMMMd(_locale).add_Hm().pattern ?? 'd MMM yyyy HH:mm';
    _patterns[_DateTimeFormat.longDateLongTime] =
        intl.DateFormat.yMMMMEEEEd(_locale).add_jms().pattern ??
            'EEEE, MMMM d, yyyy h:mm:ss a';
    _patterns[_DateTimeFormat.longDateLongTime24] =
        intl.DateFormat.yMMMMEEEEd(_locale).add_Hms().pattern ??
            'EEEE, MMMM d, yyyy HH:mm:ss';
    _patterns[_DateTimeFormat.longDateShortTime] =
        intl.DateFormat.yMMMMEEEEd(_locale).add_jm().pattern ??
            'EEEE, MMMM d, yyyy h:mm a';
    _patterns[_DateTimeFormat.longDateShortTime24] =
        intl.DateFormat.yMMMMEEEEd(_locale).add_Hm().pattern ??
            'EEEE, MMMM d, yyyy HH:mm';
    _patterns[_DateTimeFormat.longMonthDayYearLongTime] =
        intl.DateFormat.yMMMMd(_locale).add_jms().pattern ??
            'MMMM d, yyyy h:mm:ss a';
    _patterns[_DateTimeFormat.longMonthDayYearLongTime24] =
        intl.DateFormat.yMMMMd(_locale).add_Hms().pattern ??
            'MMMM d, yyyy HH:mm:ss';
    _patterns[_DateTimeFormat.longMonthDayYearShortTime] =
        intl.DateFormat.yMMMMd(_locale).add_jm().pattern ??
            'MMMM d, yyyy h:mm a';
    _patterns[_DateTimeFormat.longMonthDayYearShortTime24] =
        intl.DateFormat.yMMMMd(_locale).add_Hm().pattern ??
            'MMMM d, yyyy HH:mm';

    if (!setEquals(_patterns.keys.toSet(), _DateTimeFormat.values.toSet())) {
      throw StateError('Unexpected _DateTimeFormat value');
    }
  }

  void _startListening() {
    if (logger.debugSyncHandler) {
      logger.d('_SynchronousResponder._startListening');
    }

    _syncReceivePort.listen(_messageReceived);
    bindings.InitCallbackManager(
      _asynchronousSendPort.nativePort,
      _syncReceivePort.sendPort.nativePort,
      _relayUserData,
    );

    _callbackReceivePort.listen((message) {
      try {
        _callbackMessageReceived(message as List);
      } catch (e) {
        logger.f(
            '_SynchronousResponder: exception processing callback message. $e');
      }
    });

    _callbackSendPort.send(_callbackReceivePort.sendPort);
  }

  void _callbackMessageReceived(List message) {
    assert(message.isNotEmpty);
    final command = message.first;

    if (command == 'updateLocale') {
      assert(message.length == 2);
      _callbackSetLocale(message[1] as String);
    } else {
      logger.e('_SynchronousResponder: unknown command $command');
    }
    _testSendPort?.send(command);
  }

  void _callbackSetLocale(String locale) {
    try {
      _locale = locale;
      _setupLocale();
    } catch (e) {
      logger.e('_SynchronousResponder: exception when setting locale. $e');
      _locale = _defaultLanguage;
      _setupLocale();
    }
  }

  void _messageReceived(message) {
    if (logger.debugSyncHandler) logger.d('sync message received');
    assert(message.isNotEmpty);
    final sendPort = message[0] as SendPort;

    Object? response;
    try {
      response = _computeResponse(message);
    } catch (e) {
      logger.f('_SynchronousResponder: exception when computing response. $e');
      response = '';
    }

    _testSendPort?.send(response);
    sendPort.send(response);
  }

  Object? _computeResponse(List message) {
    assert(message.length >= 2);
    final syncType = message[1] as int;

    Object? response;
    switch (syncType) {
      case SyncType.syncTypePlatformHelpersProvider_applicationLocale:
        assert(message.length == 3);
        final userData = ffi.Pointer<ffi.Void>.fromAddress(message[2] as int);
        response = _applicationLocale(userData);
      case SyncType.syncTypePlatformHelpersProvider_convertNumber:
        assert(message.length == 7);
        final userData = ffi.Pointer<ffi.Void>.fromAddress(message[2] as int);
        final number = message[3] as double;
        final precision = message[4] as int;
        final useAsDecimalPlaces = message[5] as bool;
        final useThousandsSeparator = message[6] as bool;
        response = _convertNumber(
          userData,
          number,
          precision,
          useAsDecimalPlaces,
          useThousandsSeparator,
        );
      case SyncType.syncTypePlatformHelpersProvider_convertDateTime:
        assert(message.length == 5);
        final userData = ffi.Pointer<ffi.Void>.fromAddress(message[2] as int);

        final dateTimeHandle =
            ffi.Pointer<ffi.Void>.fromAddress(message[3] as int)
                as RT_DateTimeHandle;
        final dateTime = dateTimeHandle.toDateTime()!.toLocal();

        final format = _DateTimeFormat._fromCoreValue(message[4] as int);
        response = _convertDateTime(userData, dateTime, format);
      case SyncType.syncTypeResourceProvider_getResourceString:
        assert(message.length == 5);
        final userData = ffi.Pointer<ffi.Void>.fromAddress(message[2] as int);
        final languageId = message[3] as String;
        final compoundId = message[4] as String;

        response = _getResourceString(userData, languageId, compoundId);
      default:
        throw ArgumentError('Unsupported sync type $syncType');
    }

    return response;
  }

  String _applicationLocale(ffi.Pointer<ffi.Void> userData) {
    return _locale;
  }

  String _convertNumber(
    ffi.Pointer<ffi.Void> userData,
    double number,
    int precision,
    bool useAsDecimalPlaces,
    bool useThousandsSeparator,
  ) {
    final numberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: _locale,
      decimalDigits: useAsDecimalPlaces ? precision : null,
    );

    if (!useAsDecimalPlaces) {
      numberFormat.minimumSignificantDigits = precision;
      numberFormat.maximumSignificantDigits = precision;
    }

    if (!useThousandsSeparator) {
      numberFormat.turnOffGrouping();
    }

    return numberFormat.format(number);
  }

  String _convertDateTime(
    ffi.Pointer<ffi.Void> userData,
    DateTime dateTime,
    _DateTimeFormat format,
  ) {
    final pattern = _patterns[format]!.replaceAll('/', _dateSeparator);
    final dateFormat = intl.DateFormat(pattern, _locale);

    return dateFormat.format(dateTime);
  }

  String _getResourceString(
    ffi.Pointer<ffi.Void> userData,
    String languageId,
    String compoundId,
  ) {
    // ResourceProvider used to support a more elaborate mechanism for fetching resource strings.
    // Now all it does is tell core about the system locale.
    assert(compoundId == 'na_CurrentLanguage');
    assert(languageId.isEmpty);

    // The Dart Locale class will correct for any depricated or replaced
    // language codes.
    final languageParts = _locale.split('-');
    final Locale locale;
    if (languageParts.length == 1) {
      locale = Locale(languageParts[0]);
    } else {
      locale = Locale(languageParts[0], languageParts[1]);
    }

    // Set of languages supported by ArcGIS
    const supportedLanguages = {
      'ar',
      'bg',
      'bs',
      'ca',
      'cs',
      'da',
      'de',
      'el',
      'en',
      'es',
      'et',
      'fi',
      'fr',
      'he',
      'hr',
      'hu',
      'id',
      'it',
      'ja',
      'ko',
      'lt',
      'lv',
      'nb',
      'nl',
      'pl',
      'pt-BR',
      'pt-PT',
      'ro',
      'ru',
      'sk',
      'sl',
      'sr',
      'sv',
      'th',
      'tr',
      'uk',
      'vi',
      'zh-CN',
      'zh-HK',
      'zh-TW',
    };

    // Check if _locale is in the supported list.
    // - First check for language-country (fr-CA)
    // - If not, use language only (fr)
    // - If that fails, use the default.
    var language = '${locale.languageCode}-${locale.countryCode}';
    if (!supportedLanguages.contains(language)) {
      language = locale.languageCode;
      if (!supportedLanguages.contains(language)) {
        language = _defaultLanguage;
      }
    }

    return language;
  }
}

/// @nodoc
class SynchronousResponderTest {
  // When testing is enabled, SynchronousResponder will send a copy of the
  // results of its calls to this ReceivePort. Listen on receivePort to receive
  // the results.
  @visibleForTesting
  static void enableTesting(String locale) {
    testLocale = locale;
    receivePort = ReceivePort();
    _initializeArcGISEnvironmentIfNeeded();
  }

  @visibleForTesting
  static String? testLocale;

  @visibleForTesting
  static ReceivePort? receivePort;

  @visibleForTesting
  static void testApplicationLocale() {
    bindings.syncPlatformHelpersProvider_applicationLocale(
      ffi.nullptr,
      ffi.nullptr,
    );
  }

  @visibleForTesting
  static void testConvertNumber(
    double number,
    int precision,
    bool useAsDecimalPlaces,
    bool useThousandsSeparator,
  ) {
    bindings.syncPlatformHelpersProvider_convertNumber(
      ffi.nullptr,
      number,
      precision,
      useAsDecimalPlaces,
      useThousandsSeparator,
      ffi.nullptr,
    );
  }

  @visibleForTesting
  static void testConvertDateTime(
    DateTime dateTime,
    int format,
  ) {
    final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_fromUnixMilliseconds(
          dateTime.millisecondsSinceEpoch, errorHandler);
    });
    bindings.syncPlatformHelpersProvider_convertDateTime(
      ffi.nullptr,
      dateTimeHandle,
      format,
      ffi.nullptr,
    );
  }

  @visibleForTesting
  static void testGetResourceString(
      String languageIdString, String compoundIdString) {
    final languageIdCString = _CString(languageIdString);
    final languageId = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_String_create(
          languageIdCString.bytes, errorHandler);
    });
    final compoundIdCString = _CString(compoundIdString);
    final compoundId = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_String_create(
          compoundIdCString.bytes, errorHandler);
    });
    final paramsBuilder = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Array_createBuilder(
          RT_ElementType.RT_ElementType_string, errorHandler);
    });
    final parameters = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArrayBuilder_moveToArray(
          paramsBuilder, errorHandler);
    });
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArrayBuilder_destroy(paramsBuilder, errorHandler);
    });

    bindings.syncResourceProvider_getResourceString(
        ffi.nullptr, languageId, compoundId, parameters, ffi.nullptr);
  }
}
