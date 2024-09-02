import SwiftUI

@main
struct TextImageGeneratorApp: App {
    let texts: [String] = [
        "Текст 1", "Текст 2", "Текст 3" // Замените на свои 100 текстов
    ]

    var body: some Scene {
        WindowGroup {
            Text("Создание изображений...")
                .onAppear {
                    saveAllImages()
                }
        }
    }

    func saveAllImages() {
        for (index, text) in texts.enumerated() {
            let view = TextDisplayView(text: text)
            let fileName = "Image_\(index)"
            savePNG(view: view, fileName: fileName)
            print("Сохранил изображение: \(fileName)")
        }
    }

    func savePNG(view: some View, fileName: String) {
        let controller = NSHostingController(rootView: view)
        let view = controller.view

        let targetSize = CGSize(width: 800, height: 600)
        view.setFrameSize(targetSize)

        let bitmapRep = view.bitmapImageRepForCachingDisplay(in: view.bounds)!
        view.cacheDisplay(in: view.bounds, to: bitmapRep)
        let image = NSImage(size: targetSize)
        image.addRepresentation(bitmapRep)

        let downloadsURL = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("\(fileName).png")

        if let pngData = image.tiffRepresentation, let bitmap = NSBitmapImageRep(data: pngData) {
            let pngData = bitmap.representation(using: .png, properties: [:])
            do {
                try pngData?.write(to: downloadsURL)
                print("Успешно сохранено: \(downloadsURL.path)")
            } catch {
                print("Не удалось сохранить изображение: \(error.localizedDescription)")
            }
        } else {
            print("Не удалось создать данные изображения.")
        }
    }
}

struct TextDisplayView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
    }
}
