#if os(iOS)
import UIKit
extension UIImage {
    var resolution: CGSize {
        CGSize(width: size.width * scale, height: size.height * scale)
    }

    func resize(to targetSize: CGSize) -> UIImage {
        guard targetSize != resolution else {
            return self
        }

        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        format.opaque = true
        let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
        let resizedImage = renderer.image { _ in
            self.draw(in: CGRect(origin: CGPoint.zero, size: targetSize))
        }

        return resizedImage
    }
}

#elseif os(macOS)

import AppKit

extension NSImage {
    var scale: CGFloat {
        get {
            guard let rep = representations.first else {
                return 1.0
            }
            let pixelsWide = CGFloat(rep.pixelsWide)
            let pixelsHigh = CGFloat(rep.pixelsHigh)
            let pointsWide = size.width
            let pointsHigh = size.height

            let scaleX = pixelsWide / pointsWide
            let scaleY = pixelsHigh / pointsHigh

            // Assuming square pixels, return the average scale
            return (scaleX + scaleY) / 2.0
        }
        set {
            guard let rep = representations.first as? NSBitmapImageRep else {
                return
            }
            let newWidth = size.width * newValue
            let newHeight = size.height * newValue
            rep.size = NSSize(width: newWidth, height: newHeight)
        }
    }
}

extension NSImage {
    var resolution: CGSize {
        CGSize(width: size.width * scale, height: size.height * scale)
    }

    func resize(to targetSize: NSSize) -> NSImage {
        guard targetSize != size else {
            return self
        }

        let newImage = NSImage(size: targetSize)
        newImage.lockFocus()

        let context = NSGraphicsContext.current
        context?.imageInterpolation = .high

        draw(
            in: NSRect(origin: .zero, size: targetSize),
            from: NSRect(origin: .zero, size: size),
            operation: .copy,
            fraction: 1.0
        )

        newImage.unlockFocus()

        return newImage
    }
}
#endif
