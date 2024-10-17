//
// COPYRIGHT © 2023 Esri
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

/// [Exception] type to express exceptions from the ArcGIS Maps SDK for Flutter.
final class ArcGISException implements Exception {
  /// The primary description of the exception.
  final String message;

  /// An optional additional description of the exception.
  final String additionalMessage;

  /// The domain of the exception.
  ///
  /// States if the exception is from the ArcGIS Runtime, the ArcGIS Server, or
  /// unknown.
  final _ArcGISExceptionDomain? _domain;

  /// The ArcGIS Runtime type of the exception.
  ArcGISExceptionType? get errorType {
    try {
      if (_domain == _ArcGISExceptionDomain.arcGISRuntime) {
        return ArcGISExceptionType._fromCoreValue(code);
      }
    } catch (_) {
      // do nothing
    }
    return null;
  }

  /// A system or third-party exception which occured during excecution that was
  /// passed through the ArcGIS Runtime.
  ///
  /// This property will be set to an [Exception] when the [errorType] is set to
  /// [ArcGISExceptionType.commonUserDefinedFailure]. The [message] property will also
  /// contain the [String] representation of the wrapped [Exception].
  final Exception? wrappedException;

  /// The optional underlying exception.
  final ArcGISException? underlyingException;

  /// The integer value of the [ArcGISExceptionType] in case of an internal
  /// error, or the server-reported numeric error code in case of a server error.
  final int code;

  /// The [_Error] object from which this object was built.
  ///
  /// Only objects built from the _fromError constructor will have this property
  /// set.
  _Error? _error;

  /// Release the core _Error handle.
  void _releaseCoreHandle() => _error = null;

  ArcGISException._(
      {required this.message,
      this.additionalMessage = '',
      this.code = -1,
      this.wrappedException,
      this.underlyingException,
      _ArcGISExceptionDomain? domain,
      _Error? error})
      : _domain = domain,
        _error = error;

  /// Instantiate an [ArcGISException] based on an [_Error].
  factory ArcGISException._fromError(_Error e) {
    var message = e.message;
    Exception? userDefinedException;
    ArcGISException? underlyingException;

    final underlyingError = e.underlyingError;
    if (underlyingError != null) {
      underlyingException = ArcGISException._fromError(underlyingError);
    }

    ffi.Pointer<ffi.Void> userDefinedFailure = e.userDefinedFailure;
    if (userDefinedFailure != ffi.nullptr) {
      // This provided by a ClientReference. Get the object back from the
      // ClientReferenceManager.
      userDefinedException =
          _ClientReferenceManager.getDartObject(userDefinedFailure)
              as Exception;
      message = userDefinedException.toString();
    }

    return ArcGISException._(
        message: message,
        additionalMessage: e.additionalMessage,
        wrappedException: userDefinedException,
        underlyingException: underlyingException,
        code: e.code,
        domain: e.domain,
        error: e);
  }

  /// Returns a [String] composed of the [message] and [additionalMessage]
  /// properties.
  @override
  String toString() {
    String msg = 'ArcGISException: code=$code; $message';
    if (additionalMessage.isNotEmpty) {
      msg = '$msg; $additionalMessage';
    }

    return msg;
  }

  /// @nodoc
  @visibleForTesting
  factory ArcGISException.create({
    required String message,
    String additionalMessage = '',
    int code = -1,
    Exception? wrappedException,
    ArcGISException? underlyingException,
  }) {
    return ArcGISException._(
      message: message,
      additionalMessage: additionalMessage,
      code: code,
      wrappedException: wrappedException,
      underlyingException: underlyingException,
      domain: _ArcGISExceptionDomain.unknown,
    );
  }
}
