//
//  HeaderView.swift
//  HIITFit
//
//  Created by Curtis Fisher on 1/24/25.
//

//
//  HeaderView.swift
//  HIITFit
//
//  Created by Curtis Fisher on 1/24/25.
//


import SwiftUI

struct HeaderView: View {
  @Binding var selectedTab: Int
  let titleText: String

  var body: some View {
    VStack {
      Text(titleText)
        .font(.largeTitle)
        .fontWeight(.black)
        .foregroundColor(.white)
      HStack {
        ForEach(Exercise.exercises.indices, id: \.self) { index in
          ZStack {
            Circle()
              .frame(width: 32, height: 32)
              .foregroundColor(.white)
              .opacity(index == selectedTab ? 0.5 : 0.0)
            Circle()
              .frame(width: 16, height: 16)
              .foregroundColor(.white)
          }
          .onTapGesture {
            selectedTab = index
          }
        }
      }
      .font(.title2)
    }
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(selectedTab: .constant(0), titleText: "Squat")
      .previewLayout(.sizeThatFits)
  }
}
