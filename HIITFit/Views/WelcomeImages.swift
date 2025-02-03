//
//  WelcomeImages.swift
//  HIITFit
//
//  Created by Curtis Fisher on 2/2/25.
//

import SwiftUI

extension WelcomeView {
    static var images: some View {
        Grid {
            GridRow { // First row
                Image("hands")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                Image("exercise")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                Image("head")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            }
            GridRow { // Second row
                Image("arm")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                Image("step-up")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                Color.clear.frame(width: 80, height: 80) // Placeholder for empty space
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 220)
        .shadow(color: Color("drop-shadow"), radius: 6, x: 5, y: 5)
        .padding(.top, 10)
        .padding(.horizontal, 20) // Combined leading/trailing padding
        .padding(.bottom, 10)
    }

  static var welcomeText: some View {
    return HStack(alignment: .bottom) {
        ContainerView {
            VStack(alignment: .leading) {
                Text("Get fit")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .kerning(2)
                Text("by exercising at home")
                    .font(.headline)
                    .fontWeight(.medium)
                    .kerning(2)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
  }
}

struct WelcomeImages_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      WelcomeView.images
      WelcomeView.welcomeText
    }
  }
}
