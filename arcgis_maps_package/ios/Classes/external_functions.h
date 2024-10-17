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

typedef CF_ENUM(uint32_t, RT_GraphicsHardwareResources) {
    RT_GraphicsHardwareResources_recycle = 0,
    RT_GraphicsHardwareResources_save = 1
};

void* RT_Device_createMetal(void* mapDevice, void* metalQueue, void* metalSurface, void* errorHandler);
void RT_Device_destroy(void* deviceHandle, void* errorHandler);
void RT_GeoView_draw(void* geoViewHandle, void* deviceHandle, void* errorHandler);
void RT_GeoView_hasValidSize(void* geoViewHandle, void* errorHandler);
void RT_GeoView_pause(void* geoViewHandle, void* deviceHandle, RT_GraphicsHardwareResources graphicsHardwareResources, void* errorHandler);
void RT_GeoView_pulse(void* geoViewHandle, void* errorHandler);
void RT_GeoView_resize(void* geoViewHandle, int32_t width, int32_t height, void* errorHandler);
void RT_GeoView_resume(void* geoViewHandle, void* deviceHandle, void* errorHandler);

typedef void (*RT_GeoView_drawRequested_fn)(void* userData);
void RT_GeoView_setDrawRequestedCallback(void* geoViewHandle, RT_GeoView_drawRequested_fn callback, void* userData, void* errorHandler);

typedef void (*GeoViewDestroyed_fn)(void* userData);
void setGeoViewDestroyedCallback(void* geoViewHandle, GeoViewDestroyed_fn callback, void* userData);
