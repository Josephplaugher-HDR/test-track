# Configure an App to use ArcGIS Maps SDK for Flutter

## Step 1: Create a new Flutter app

Create a new Flutter app with desired name and platforms.

```
flutter create your_app_name --platforms ios,android --org com.anExampleOrg
```

## Step 2: Add ArcGIS Maps to your app

Unpack the arcgis_maps_package archive into the same parent directory as your app.

macOS:

```
tar xzf arcgis_maps_package.<version>.tar.gz
```

Windows:

```
tar -xf arcgis_maps_package.<version>.zip
```

Your file structure should be:

```
parent_directory
   |
   |__ your_app_name
   |
   |__ arcgis_maps_package
```

Add a dependency to "arcgis_maps".

```
cd your_app_name
dart pub add 'arcgis_maps:{\"path\":\"../arcgis_maps_package\"}'
```

Use `flutter pub upgrade` to configure the dependencies.

```
flutter pub upgrade
```

Install arcgis_maps_core.

Note on Windows: this step requires permission to create symlinks. Either run this step in an elevated "Administrator" command prompt, or go to "Settings > Update & Security > For developers" and turn on "Developer Mode".

```
dart run arcgis_maps install
```

Add "arcgis_maps_core" to your `.gitignore` file.

```
# Miscellaneous
arcgis_maps_core
...
```

## Step 3: Platform specific configuration

### Android

Update minimum requirements by editing the `android/app/build.gradle` file:
- Set Android NDK 25.2.9519653 minimum
- Set Android SDK 26 minimum

```
android {
    ...
    ndkVersion "25.2.9519653"
    ...
    defaultConfig {
        ...
        minSdk 26
        ...
    }
...
}
```

Update the Kotlin version by editing the `android/settings.gradle` file:
- Set Kotlin version to 1.9.0

```
plugins {
    ...
    id "org.jetbrains.kotlin.android" version "1.9.0" apply false
}
```

To access online resources, add permission to the `android/app/src/main/AndroidManifest.xml` file:

```
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET" />
...
```

### iOS

Set iOS 16.0 minimum by editing the `ios/Podfile` file. First uncomment the line and then update the version number.

```
platform :ios, '16.0'
```

Configure `arcgis_maps_core` by adding the `Runtimecore` and `arcgis_maps_ffi` pods to the `Runner` target section

```
target 'Runner' do
  ...

  pod 'Runtimecore', :podspec => '../arcgis_maps_core/ios/Runtimecore.podspec'
  pod 'arcgis_maps_ffi', :podspec => '../arcgis_maps_core/ios/arcgis_maps_ffi.podspec'

  ...
end
```

Use `pod update` to configure Pods

```
cd ios && pod update && cd ..
```

## Step 4: Add a map and run your app!

Open `lib/main.dart`.

After the other `import` lines, add:

```dart
import 'package:arcgis_maps/arcgis_maps.dart';
```

To take full advantage of the SDK, you will need to generate an API Key access token. Follow the [Create an API Key](https://links.esri.com/create-an-api-key) tutorial. Ensure that you set the required Location services privileges, such as **Basemap**, **Geocoding**, or **Routing**. Set the API key in the `main()` method.

```dart
void main() {
    ArcGISEnvironment.apiKey = 'YOUR_ACCESS_TOKEN';
    ...
}
```

Add an `ArcGISMapView` Widget to the widget tree and apply an `ArcGISMap`.

The `ArcGISMapView` Widget can only be used within a Widget that has a bounded size. Using it with unbounded size will cause the application to throw an exception. For example, to use an `ArcGISMapView` within a `Column` (which would give it unbounded size), you could wrap the `ArcGISMapView` in an `Expanded` to provide it proper bounds.

```dart
...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ArcGISMapView(
              controllerProvider: () {
                return ArcGISMapView.createController()
                  ..arcGISMap = ArcGISMap.withBasemapStyle(BasemapStyle.arcGISTopographic);
              },
            ),
          ),
        ],
      ),
    );
  }
...
```

Make sure you have an Android Emulator and an iOS Simulator and/or physical devices configured and running. Run on each device using:

```
flutter run
```

# Additional information

## Enabling device location

If you require the use of GPS in your application, you may need to add additional keys and permissions.

#### Android

Add permission to the `android/app/src/main/AndroidManifest.xml` file:

```
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
...
```

#### iOS 

Add keys in `ios/Runner/Info.plist`. Add NSLocationAlwaysAndWhenInUseUsageDescription, NSLocationUsageDescription, and NSLocationWhenInUseUsageDescription. These can be configured in Xcode directly, or by updating the `Info.plist` file in VSCode as follows:

```
<plist version="1.0">
<dict>
	<key>NSLocationWhenInUseUsageDescription</key>
	<string>Location permission is required to view your position.</string>
	<key>NSLocationUsageDescription</key>
	<string>Location permission is required to view your position.</string>
	<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
	<string>Location permission is required to view your position.</string>
...
```

## Enabling OAuth authentication for Android

If you require the use of system browser for OAuth user login, you need to add the following configurations to the `android/app/src/main/AndroidManifest.xml` file:

```
<manifest>
  <application>
    <activity
      android:name="com.linusu.flutter_web_auth_2.CallbackActivity"
      android:exported="true">
      <intent-filter android:label="flutter_web_auth_2">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="YOUR_CALLBACK_URL_SCHEME_HERE" />
      </intent-filter>
    </activity>
  </application>
</manifest>
```

Replace YOUR_CALLBACK_URL_SCHEME_HERE with the scheme of the redirect URL used when you set up OAuth 2.0 in your developer dashboard. This is necessary so that the browser can communicate back to your app after the login workflow completes.

## Building your app

Use `flutter build` to verify building an iOS application bundle and an Android APK.

```
flutter build ios
flutter build apk
```

Use `flutter install` to install a release build on your devices. Launch and test the build on each device.
