import SwiftUI

struct AnimatedTextView: View {
    @State var textOpacity: Double = 0.0
    var text: String
    var opacity: Double

    var body: some View {
        VStack{
            Text(text)
                .multilineTextAlignment(.center)
                .padding(.all)
                .foregroundColor(Color("BlueColor"))
                .font(.custom("Gilroy", size: 60))
                .onAppear {
                    withAnimation(.default) {
                        textOpacity = 1.0
                    }
                }
                .opacity(opacity)
        }
        .frame(width: 1000, height: 1000)
        .background(Image("backImg"))
    }
}

struct AnimatedTextView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedTextView(text: "Пример текста", opacity: 1)
    }
}
