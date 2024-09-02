//import AppKit
//import SwiftUI
//
//@main
//struct TextGIFApp: App {
//    var body: some Scene {
//        WindowGroup {
//            AnimatedTextView(text: "Пример текста")
//                .onAppear {
//                    createTextGIF()
//                }
//        }
//    }
//
//    func createTextGIF() {
//        let text = "Пример текста"
//        var images = [NSImage]()
//
//        for i in 0...10 {
//            let opacity = Double(i) / 10.0
//            let view = AnimatedTextView(text: text)
//                .opacity(opacity)
//
//            let fileName = "frame_\(i)"
//            saveFrame(view: view, fileName: fileName)
//
//            let desktopURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//                .appendingPathComponent("\(fileName).gif")
//
//            if let image = NSImage(contentsOf: desktopURL) {
//                images.append(image)
//            } else {
//                print("Failed to load image at: \(desktopURL.path)")
//            }
//        }
//
//        let gifFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//            .appendingPathComponent("frame_.png")
//
//        createGIF(from: images, to: gifFileURL, frameDelay: 0.2)
//    }
//
//    func createGIF(from images: [NSImage], to fileURL: URL, frameDelay: Double) {
//        guard !images.isEmpty else {
//            print("No images to create GIF.")
//            return
//        }
//
//        guard let destination = CGImageDestinationCreateWithURL(fileURL as CFURL, kUTTypeGIF, images.count, nil) else {
//            print("Failed to create GIF destination.")
//            return
//        }
//
//        let frameProperties = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFDelayTime as String: frameDelay]]
//        let gifProperties = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFLoopCount as String: 0]]
//
//        for image in images {
//            if let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil) {
//                CGImageDestinationAddImage(destination, cgImage, frameProperties as CFDictionary)
//            } else {
//                print("Failed to convert NSImage to CGImage.")
//            }
//        }
//
//        CGImageDestinationSetProperties(destination, gifProperties as CFDictionary)
//        if CGImageDestinationFinalize(destination) {
//            print("GIF created at: \(fileURL.path)")
//        } else {
//            print("Failed to finalize GIF creation.")
//        }
//    }
//}

import SwiftUI

@main
struct TextImageGeneratorApp: App {
    let texts: [String] = [
        "Этот год станет большим открытием.",
            "Вы сможете преодолеть преграды на пути к своей цели.",
            "Каждый час кропотливого труда в итоге принесёт свои плоды.",
            "Вы откроете для себя новые горизонты знаний.",
            "Вы прокачаете свои слабые стороны.",
            "Вы станете экспертом в своей области.",
            "Ваши усилия оправдаются.",
            "Вы получите поддержку от преподавателей и друзей.",
            "Ваши идеи будут услышаны и оценены по достоинству.",
            "У вас будет возможность проявить свой талант.",
            "Каждый экзамен станет для вас возможностью показать свои знания.",
            "Вы снова и снова будете удивляться своими способностями.",
            "Этот год принесёт вам множество счастливых моментов.",
            "Настойчивость приведёт к заслуженному успеху.",
            "Вы научитесь управлять своим временем лучше, чем когда-либо.",
            "Не бойтесь просить помощи — Вы не одни.",
            "Ваш труд не останется незамеченным.",
            "Учёба станет увлекательным путешествием.",
            "Вы будете гордиться своими достижениями.",
            "Оглянитесь по сторонам. Студенческая жизнь прекрасна!",
            "Вас ждут интересные встречи и новые друзья.",
            "У Вас появится идея, которая изменит мир.",
            "Каждый новый семестр подарит новые возможности.",
            "Вы научитесь решать задачи творчески и эффективно.",
            "Команда — это сила, и Вы станете ценным членом своей команды.",
            "Никакая неудача не остановит Вас на пути к цели.",
            "Вы обретёте уверенность в своих силах.",
            "Страх перед экзаменами превратится в уверенность.",
            "Вы встретите людей, которые вдохновят Вас.",
            "Ваши знания откроют двери для новых возможностей.",
            "Этот учебный год — Ваш год!",
            "Вы сможете написать великолепную курсовую работу.",
            "Каждый вечер будет приносить Вам радость от выполненной работы.",
            "Вы удивите себя своей работоспособностью.",
            "Занимайтесь тем, что Вам нравится, и успех будет неизбежен.",
            "Вы научитесь работать в команде и достигать общих целей.",
            "Ваши идеи начнут воплощаться в реальность.",
            "Опыт, который Вы получите, окажется бесценным.",
            "Ваши старания приведут к высокой оценке.",
            "Этот год принесёт серьёзные, необратимые перемены к лучшему.",
            "Вы сможете создать что-то уникальное.",
            "Отдых и учёба могут идти рука об руку.",
            "Этот год преподнесёт Вам очень важный жизненный урок.",
            "Вы будете проходить через любые трудности с улыбкой.",
            "Учёба станет для Вас настоящим удовольствием.",
            "Вы завоюете доверие своих однокурсников и преподавателей.",
            "Ваши усилия будут вознаграждены результатами.",
            "Вы научитесь ценить каждую мелочь на пути к успеху.",
            "Вы сделаете шаг навстречу своей карьере.",
            "Этот год принесёт Вам карьерный и духовный рост.",
            "Вы обнажите свои скрытые таланты.",
            "Этот год — это возможность для Вашего роста.",
            "Ваши достижения вдохновят других студентов.",
            "Не бойтесь выходить за рамки.",
            "Вы научитесь смело выражать свои мысли.",
            "Вы будете участвовать в интересных мероприятиях.",
            "Этот учебный год в корне изменит к лучшему Вашу личность.",
            "Вы займётесь тем, что принесёт Вам радость.",
            "Ваша креативность будет стимулировать окружающих.",
            "Каждый раз, когда Вы терпите неудачу, Вы становитесь сильнее.",
            "В процессе учёбы Вы обретёте друзей на всю жизнь.",
            "Этот год познакомит Вас с замечательными людьми.",
            "Вам стоит подумать над новой целью, потому что старая вот-вот будет достигнута.",
            "Вы поймёте, чего хотите на самом деле.",
            "С каждым днём Вы будете становиться мудрее.",
            "Вы сможете внести свой вклад в научное сообщество.",
            "Вы достигнете своих целей, преодолевая сомнения.",
            "Этот год подарит множество ярких воспоминаний.",
            "Вы будете совершенствоваться и развиваться быстрее, чем обычно.",
            "Вас ждут интересные мероприятия и активности.",
            "Вы найдёте радость в учёбе.",
            "Этот учебный год будет полон открытий.",
            "Вы почувствуете себя нужным и важным.",
            "Ваши интересы будут в центре внимания.",
            "В процессе обучения Вы развиваетесь как личность.",
        "У Вас появится возможность проявить инициативу.",
            "Вы сможете гордиться не только собой, но и своими друзьями.",
            "Вы создадите воспоминания, которые останутся с Вами навсегда.",
            "Вы получите удовольствие от командной работы.",
            "Этот год разблокирует новый уровень знаний.",
            "Вы сможете преодолеть все сомнения и страхи.",
            "Вы научитесь принимать решения и не бояться последствий.",
            "Вы обретёте множество полезных навыков.",
            "Вы будете не просто студентом, а лидером своей группы.",
            "Каждый новый опыт только укрепит Вашу веру в себя.",
            "Вы сможете поймать баланс между учёбой и отдыхом.",
            "Вы готовы обогатить свою жизнь новыми знаниями.",
            "Этот год станет началом больших перемен.",
            "Вы научитесь оценивать свой прогресс.",
            "Вы сможете вдохновить других своим примером.",
            "Вы чувствуете себя уверенно перед любыми испытаниями.",
            "Каждый шаг будет приближать Вас к цели.",
            "Вы запомните этот год как один из лучших.",
            "Вы получите возможность исследовать новое.",
            "Каждый новый день будет приносить много эмоций от учёбы.",
            "Вы обретёте спокойствие и стабильность.",
            "Этот год станет для Вас школой жизни.",
            "Вы сможете проявить свои лидерские качества.",
            "Ваша страсть к знаниям станет Вашим могущественным оружием.",
            "Вы готовы к новым вызовам, и они принесут массу удовольствия!"

    ]

    var body: some Scene {
        WindowGroup {
            VStack {
                ForEach(0..<texts.count, id: \.self) { index in
                    ContentView(text: texts[index])
                        .onAppear {
                            savePNG(view: ContentView(text: texts[index]), fileName: "Image_\(index)")
                        }
                }
            }
        }
    }

    func savePNG(view: some View, fileName: String) {
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
}
