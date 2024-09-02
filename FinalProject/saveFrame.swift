import SwiftUI

func saveFrame(view: some View, fileName: String) {
    let controller = NSHostingController(rootView: view)
    let view = controller.view

    let targetSize = CGSize(width: 1000, height: 1000)
    view.setFrameSize(targetSize)

    let bitmapRep = view.bitmapImageRepForCachingDisplay(in: view.bounds)!
    view.cacheDisplay(in: view.bounds, to: bitmapRep)
    let image = NSImage(size: targetSize)
    image.addRepresentation(bitmapRep)

    let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        .appendingPathComponent("\(fileName).png")

    if let pngData = image.tiffRepresentation, let bitmap = NSBitmapImageRep(data: pngData) {
        let pngData = bitmap.representation(using: .png, properties: [:])
        try? pngData?.write(to: fileURL)
    }
}
