import ImageIO
import Foundation
import AppKit

func createGIF(from images: [NSImage], to fileURL: URL, frameDelay: Double) {
    guard let destination = CGImageDestinationCreateWithURL(fileURL as CFURL, kUTTypeGIF, images.count, nil) else { return }

    let frameProperties = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFDelayTime as String: frameDelay]]
    let gifProperties = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFLoopCount as String: 0]]

    for image in images {
        if let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil) {
            CGImageDestinationAddImage(destination, cgImage, frameProperties as CFDictionary)
        }
    }

    CGImageDestinationSetProperties(destination, gifProperties as CFDictionary)
    CGImageDestinationFinalize(destination)
}
