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

class _AuthenticationOAuthHandler {
  final AuthenticationManager _authenticationManager;
  _AuthenticationOAuthHandler(this._authenticationManager) {
    _authenticationManager._onOauthUserLogin.listen(_handlePrompt);
  }

  void _handlePrompt(_OAuthUserLoginPrompt prompt) async {
    try {
      final result = await FlutterWebAuth2.authenticate(
        url: prompt.authorizeUri.toString(),
        callbackUrlScheme: prompt.redirectUri.scheme,
        options: FlutterWebAuth2Options(
          preferEphemeral: prompt.preferPrivateWebBrowserSession,
          intentFlags: prompt.preferPrivateWebBrowserSession
              ? ephemeralIntentFlags
              : defaultIntentFlags,
        ),
      );
      prompt.respond(uri: Uri.parse(result));
    } on PlatformException catch (e) {
      prompt.respondWithError(
        platformApiError:
            _ClientReferenceManager.generateClientReferenceFromDartObject(
          e.code == 'CANCELED' ? _userCanceledException : e,
        ),
      );
    } catch (e) {
      prompt.respondWithError(
          platformApiError:
              _ClientReferenceManager.generateClientReferenceFromDartObject(e));
    }
  }
}
