//
//  TrafficLight.swift
//  TrafficLightSwiftUI
//
//  Created by vtsyganov on 27.07.2021.
//

import SwiftUI

let backgroundGradient = LinearGradient(
    gradient: Gradient(
        colors: [Color.red, Color.yellow, Color.green]
    ),
    startPoint: .top,
    endPoint: .bottom
)

enum lightColor: String {
    case red = "Start"
    case yellow = "Wait!"
    case green = "Get ready!"
    case none = "Go!"
}

struct TrafficLight: View {
    @State var currentColor = lightColor.red
    let baseShadowRadius: CGFloat = 150
    
    @State var redOpacity = 0.5
    @State var yellowOpacity = 0.5
    @State var greenOpacity = 0.5
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            VStack {
                CircleView(opacity: redOpacity, color: .red, shadowRadius: baseShadowRadius * CGFloat(redOpacity))
                CircleView(opacity: yellowOpacity, color: .yellow, shadowRadius: baseShadowRadius * CGFloat(yellowOpacity))
                CircleView(opacity: greenOpacity, color: .green, shadowRadius: baseShadowRadius * CGFloat(greenOpacity))

                Spacer()
                
                Button(action: {
                    
                    switch currentColor {
                    case .red :
                        currentColor = .yellow
                        redOpacity = 1
                    case .yellow :
                        currentColor = .green
                        redOpacity = 0.5
                        yellowOpacity = 1
                    case .green :
                        currentColor = .none
                        yellowOpacity = 0.5
                        greenOpacity = 1
                    default:
                        currentColor = .red
                        greenOpacity = 0.5
                    }
                    
                }) {
                    Text(currentColor.rawValue)
                        .frame(width: 150, height: 50)
                        .background(backgroundGradient)
                        .foregroundColor(.white)
                        .font(.title)
                        .cornerRadius(30)
                        .opacity(0.9)
                }
                
            }
        }
    }
}

struct TrafficLight_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLight()
    }
}
