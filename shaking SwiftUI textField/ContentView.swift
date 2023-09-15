//
//  ContentView.swift
//  shaking SwiftUI textField
//
//  Created by Krzysztof Czura on 15/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    @State private var isShaking: Bool = false

    var body: some View {
        ZStack {
            Color.mint.ignoresSafeArea()
            VStack {
                TextField("Enter your text", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .modifier(ShakeEffect(animatableData: isShaking ? 3 : 0)) // 3 means three shakes
                    .font(Font.system(size: 14))
                    .padding(.horizontal, 20)
                
                Button("Shake") {
                    withAnimation {
                        isShaking.toggle()
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct ShakeEffect: GeometryEffect {
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        let xOffset = sin(animatableData * .pi * 2) * 5 // A value of 5 determines the shaking amplitude.
        return ProjectionTransform(CGAffineTransform(translationX: xOffset, y: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
