//
//  CircleView.swift
//  TrafficLightSwiftUI
//
//  Created by vtsyganov on 27.07.2021.
//

import SwiftUI

let diameter: CGFloat = 150

struct CircleView: View {
    
    var opacity: Double
    var color: Color
    var shadowRadius: CGFloat
    
    var body: some View {
        Circle()
            .frame(width: diameter, height: diameter)
            .opacity(opacity)
            .shadow(color: color, radius: 30)
            .overlay(Circle().stroke(color, lineWidth: 1))
            .foregroundColor(color)
            .padding(5)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(opacity: 0.5, color: .black, shadowRadius: 40)
    }
}
