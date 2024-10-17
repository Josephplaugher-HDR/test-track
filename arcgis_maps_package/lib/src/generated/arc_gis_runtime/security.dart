//
// COPYRIGHT © 2024 ESRI
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

// AUTO GENERATED FILE, DO NOT EDIT.

// ignore_for_file: unused_element, unused_field

part of '../../../arcgis_maps.dart';

enum AuthenticationChallengeType {
  unknown,

  usernamePassword,

  oauth,

  clientCertificate,

  untrustedHost;

  factory AuthenticationChallengeType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return unknown;
      case 1:
        return usernamePassword;
      case 2:
        return oauth;
      case 3:
        return clientCertificate;
      case 4:
        return untrustedHost;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return 0;
      case usernamePassword:
        return 1;
      case oauth:
        return 2;
      case clientCertificate:
        return 3;
      case untrustedHost:
        return 4;
    }
  }
}

/// Constants indicating the interface style.
enum UserInterfaceStyle {
  /// Choose this option when you want to follow the system's interface style.
  unspecified,

  /// The light interface style.
  light,

  /// The dark interface style.
  dark;

  factory UserInterfaceStyle._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return unspecified;
      case 1:
        return light;
      case 2:
        return dark;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unspecified:
        return 0;
      case light:
        return 1;
      case dark:
        return 2;
    }
  }
}
