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

class _ErrorHandler implements ffi.Finalizable {
  final coreErrorHandler = malloc<RT_ErrorHandler>();

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.nativeFree.cast());

  _ErrorHandler() {
    _nativeFinalizer.attach(this, coreErrorHandler.cast());

    coreErrorHandler.ref.handler = bindings.addresses.syncErrorFn;
    coreErrorHandler.ref.userData =
        ffi.Pointer<ffi.Void>.fromAddress(identityHashCode(this));
  }

  void throwIfError() {
    final e = _fetchError();
    if (e != null) {
      if (logger.debugErrorHandler) {
        logger.d('throwing: "${e.message}"\n${StackTrace.current}');
      }
      throw ArcGISException._fromError(e);
    }
  }

  void warnIfError() {
    final e = _fetchError();
    if (e != null) logger.w('warn: "${e.message}"\n${StackTrace.current}');
  }

  _Error? _fetchError() {
    final rtHandle = bindings.fetchSyncError(coreErrorHandler.ref.userData);
    if (rtHandle == ffi.nullptr) return null;

    return _Error._withHandle(rtHandle);
  }
}

/// Invokes the given function with an error handler and after it completes,
/// throws if an error was handled.
R _withThrowingErrorHandler<R>(
    R Function(ffi.Pointer<RT_ErrorHandler> errorHandler) body) {
  final errorHandler = _ErrorHandler();
  final result = body(errorHandler.coreErrorHandler);
  errorHandler.throwIfError();
  return result;
}

/// Invokes the given function with an error handler and after it completes,
/// prints the handled error (if any) to the console as a warning.
R _withWarningErrorHandler<R>(R Function(ffi.Pointer<RT_ErrorHandler>) body) {
  final errorHandler = _ErrorHandler();
  final result = body(errorHandler.coreErrorHandler);
  errorHandler.warnIfError();
  return result;
}
