Pod::Spec.new do |spec|
  spec.name                   = 'arcgis_maps'
  spec.version                = '200.5.0.4314'
  spec.summary                = 'FFI plugin for the ArcGIS Maps SDK for Flutter'
  spec.description            = <<-DESC
FFI plugin for the ArcGIS Maps SDK for Flutter
                       DESC
  spec.homepage               = 'https://developers.arcgis.com'
  spec.license                = { :file => '../LICENSE' }
  spec.author                 = { 'Esri' => 'https://www.esri.com/' }

  spec.source                 = { :path => '.' }
  spec.source_files           = 'Classes/**/*'
  spec.public_header_files    = 'Classes/**/*.h'

  spec.dependency 'Flutter'
  spec.dependency 'Runtimecore'
  spec.dependency 'arcgis_maps_ffi'

  spec.platform               = :ios, '16.0'
  spec.swift_version          = '5.0'

  spec.pod_target_xcconfig    = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }
 
end
