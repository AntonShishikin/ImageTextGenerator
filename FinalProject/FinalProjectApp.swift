import SwiftUI

@main
struct TextGIFApp: App {
    var body: some Scene {
        WindowGroup {
            AnimatedTextView(text: "Пример текста")
                .onAppear {
                    createTextGIF()
                }
        }
    }

    func createTextGIF() {
        let text = "Пример текста"
        var images = [NSImage]()

        for i in 0...10 {
            let opacity = Double(i) / 10.0
            let view = AnimatedTextView(text: text)
                .opacity(opacity)

            let fileName = "frame_\(i)"
            saveFrame(view: view, fileName: fileName)

            let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                .appendingPathComponent("\(fileName).png")

            if let image = NSImage(contentsOf: fileURL) {
                images.append(image)
            }
        }

        let gifFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("animated_text.gif")

        createGIF(from: images, to: gifFileURL, frameDelay: 0.2)
    }
}
