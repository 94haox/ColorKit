#if os(iOS)
import UIKit

#else
import AppKit

#endif

struct RGB {
    let R: CGFloat
    let G: CGFloat
    let B: CGFloat
}

extension ColorKitColor {
    // MARK: - Pulic

    /// The red (R) channel of the RGB color space as a value from 0.0 to 1.0.
    public var red: CGFloat {
        #if os(iOS)
        CIColor(color: self).red
        #else
        CIColor(color: self)?.red ?? 0
        #endif
    }

    /// The green (G) channel of the RGB color space as a value from 0.0 to 1.0.
    public var green: CGFloat {
        #if os(iOS)
        CIColor(color: self).green
        #else
        CIColor(color: self)?.green ?? 0
        #endif
    }

    /// The blue (B) channel of the RGB color space as a value from 0.0 to 1.0.
    public var blue: CGFloat {
        #if os(iOS)
        CIColor(color: self).blue
        #else
        CIColor(color: self)?.blue ?? 0
        #endif
    }

    /// The alpha (a) channel of the RGBa color space as a value from 0.0 to 1.0.
    public var alpha: CGFloat {
        #if os(iOS)
        CIColor(color: self).alpha
        #else
        CIColor(color: self)?.alpha ?? 0
        #endif
    }

    // MARK: Internal

    var red255: CGFloat {
        red * 255.0
    }

    var green255: CGFloat {
        green * 255.0
    }

    var blue255: CGFloat {
        blue * 255.0
    }

    var rgb: RGB {
        RGB(R: red, G: green, B: blue)
    }
}
