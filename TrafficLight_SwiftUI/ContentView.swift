//
//  ContentView.swift
//  TrafficLight_SwiftUI
//
//  Created by Сергей Захаров on 15.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    enum CurrentLight {
        case red, yellow, green
    }
    
    enum Toggle: Double {
        case on = 1.0
        case off = 0.3
    }
    
    @State private var currentLight = CurrentLight.red
    @State private var redLight = Toggle.off
    @State private var yellowLight = Toggle.off
    @State private var greenLight = Toggle.off
    @State private var buttonText = "START"
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack (spacing: 60) {
                VStack (spacing: 30) {
                    CircleLightView(color:
                            .red,opacity: redLight.rawValue)
                    CircleLightView(color:
                            .yellow, opacity: yellowLight.rawValue)
                    CircleLightView(color:
                            .green, opacity: greenLight.rawValue)
                }
                Button(action: {changeLightColor()}) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 3)
                        RoundedRectangle(cornerRadius: 10)
                        Text(buttonText)
                            .foregroundColor(.white)
                    }
                    .frame(width: 120, height: 35)
                    .font(.title)
                }
            }
        }
    }
    
    private func changeLightColor() {
        
        buttonText = "NEXT"
        
        switch currentLight {
        case .red:
            redLight = Toggle.on
            yellowLight = Toggle.off
            greenLight = Toggle.off
            currentLight = CurrentLight.yellow
        case .yellow:
            redLight = Toggle.off
            yellowLight = Toggle.on
            greenLight = Toggle.off
            currentLight = CurrentLight.green
        case .green:
            redLight = Toggle.off
            yellowLight = Toggle.off
            greenLight = Toggle.on
            currentLight = CurrentLight.red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
