//
//  ContentView.swift
//  TextImageGenereator
//
//  Created by Mac  on 29.08.2024.
//

import SwiftUI

struct ContentView: View {
    var text: String

    var body: some View {
        VStack {
            Text(text)
                .multilineTextAlignment(.center)
                .padding(.all)
                .foregroundColor(Color("BlueColor"))
                .font(.custom("Gilroy", size: 60))
        }
        .frame(width: 1000, height: 1000)
        .background(Image("backImg"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: "Пример текста")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
