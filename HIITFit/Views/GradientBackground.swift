//
//  GradientBackground.swift
//  HIITFit
//
//  Created by Curtis Fisher on 2/2/25.
//



import SwiftUI

struct GradientBackground: View {
    var gradient: Gradient {
        let color1 = Color.purple;
        let color2 = Color.blue;        let background = Color("background")
        return Gradient(
            stops: [
                Gradient.Stop(color: color1, location: 0),
                Gradient.Stop(color: color2, location: 0.9),
                Gradient.Stop(color: background, location: 0.9),
                Gradient.Stop(color: background, location: 1)
            ])
    }

    var body: some View {
        LinearGradient(
            gradient: gradient,
            startPoint: .top,
            endPoint: .bottom)
        .ignoresSafeArea()
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground()
    }
}
// gradient background handles the colors of the background scheme and handles configuration for the deadspace for the phones view the safe area 
