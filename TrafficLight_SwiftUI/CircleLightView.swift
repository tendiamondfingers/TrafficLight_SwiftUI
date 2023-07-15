//
//  CircleLight.swift
//  TrafficLight_SwiftUI
//
//  Created by Сергей Захаров on 15.07.2023.
//

import SwiftUI

struct CircleLightView: View {
    
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .opacity(opacity)
            .frame(width: 120, height: 120)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct CircleLight_Previews: PreviewProvider {
    static var previews: some View {
        CircleLightView(color: .red, opacity: 1.0)
    }
}
