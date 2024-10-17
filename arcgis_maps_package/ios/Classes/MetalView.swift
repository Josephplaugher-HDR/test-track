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

import MetalKit
import UIKit

/// An `MTKView` subclass with additional functionality required for
/// interoperability with Flutter.
final class MetalView: MTKView {
    /// An action to perform when the display scale changes.
    var onDisplayScaleChanged: ((CGFloat) -> Void)?
    
    // MARK: UITraitEnvironment
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        let displayScale = traitCollection.displayScale
        if displayScale != previousTraitCollection?.displayScale {
            onDisplayScaleChanged?(displayScale)
        }
    }
    
    // MARK: UIView
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        if window != nil {
            onDisplayScaleChanged?(traitCollection.displayScale)
        }
    }
}
