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

part of '../arcgis_maps.dart';

/// @nodoc
class ArcGISEnvironmentCallbackReceiver implements _CallbackReceiver {
  @visibleForTesting
  ArcGISEnvironmentCallbackReceiver();

  void _handleError(_Error error) {
    logger.e('unhandled error "${error.message}"');
  }

  void _handleClientReferenceRelease(ffi.Pointer<ffi.Void> userData) {
    _ClientReferenceManager.removeDartObject(userData);
  }

  void _handleRequestRequired(_Request request) {
    ArcGISEnvironment.httpClient._requestRequired(request);
  }

  @override
  void _processCallback(List message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeArcGISRuntimeEnvironmentErrorEvent:
        assert(message.length == 3);
        final errorHandle = ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
            as RT_ErrorHandle;
        final error = _Error._withHandle(errorHandle);
        _handleError(error);
        break;
      case AsyncType.asyncTypeClientReferenceReleaseEvent:
        assert(message.length == 3);
        final userData = ffi.Pointer<ffi.Void>.fromAddress(message[2] as int);
        _handleClientReferenceRelease(userData);
      case AsyncType.asyncTypeRequestRequestRequiredEvent:
        assert(message.length == 3);
        final requestHandle =
            ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                as RT_RequestHandle;
        final request = _Request._fromHandle(requestHandle);
        _handleRequestRequired(request!);
      default:
        logger.f('ArcGISEnvironment unhandled asyncType $asyncType');
    }
  }
}
