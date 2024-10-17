cmake_minimum_required(VERSION 3.10)

project(arcgis_maps_library VERSION 0.0.1 LANGUAGES C CXX)

link_directories("${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/../../../../../../../../arcgis_maps_core/android/${CMAKE_ANDROID_ARCH_ABI}")

link_libraries(runtimecore arcgis_maps_ffi)

add_library(arcgis_maps SHARED
  "arcgis_maps.c"
)

set_target_properties(arcgis_maps PROPERTIES
  PUBLIC_HEADER arcgis_maps.h
  OUTPUT_NAME "arcgis_maps"
)

target_compile_definitions(arcgis_maps PUBLIC DART_SHARED_LIB)
