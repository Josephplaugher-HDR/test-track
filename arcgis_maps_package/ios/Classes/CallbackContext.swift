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

/// Used to manage the lifetime of the given value when going to and from core.
final class CallbackContext<Proxy> {
    /// The wrapped value.
    var proxy: Proxy?
    
    /// Creates a wrapper around the given value.
    /// - Parameter proxy: The value to be wrapped.
    init(proxy: Proxy?) {
        self.proxy = proxy
    }
    
    /// Creates a wrapper initialized to `nil`.
    convenience init() {
        self.init(proxy: nil)
    }
}
