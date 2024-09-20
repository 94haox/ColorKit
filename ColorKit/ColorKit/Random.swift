#if os(iOS)
import UIKit
#else
import AppKit
#endif

extension ColorKitColor {
    /// Generates a random `UIColor` instance.
    /// - Parameters:
    ///   - randomizeAlpha: Whether the alpha channel should also be randomized. If set to false
    /// (default), the alpha will be set to 1.0.
    public static func random(randomizeAlpha: Bool = false) -> ColorKitColor {
        let r = CGFloat.random(in: 0...255) / 255.0
        let g = CGFloat.random(in: 0...255) / 255.0
        let b = CGFloat.random(in: 0...255) / 255.0
        let a = randomizeAlpha ? 1 : CGFloat.random(in: 0...1)

        return ColorKitColor(red: r, green: g, blue: b, alpha: a)
    }
}
