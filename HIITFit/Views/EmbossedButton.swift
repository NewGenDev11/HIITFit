//
//  EmbossedButton.swift
//  HIITFit
//
//  Created by Curtis Fisher on 2/2/25.
//



import SwiftUI

enum EmbossedButtonShape {
  case round, capsule
}

struct EmbossedButtonStyle: ButtonStyle {
  var buttonShape = EmbossedButtonShape.capsule

  func makeBody(configuration: Configuration) -> some View {
      let shadow = Color.blue
      let highlight = Color.purple
    return configuration.label
      .padding(10)
      .background(
        GeometryReader { geometry in
          shape(size: geometry.size)
                .foregroundColor(Color.blue)
            .shadow(color: shadow, radius: 1, x: 2, y: 2)
            .shadow(color: highlight, radius: 1, x: -2, y: -2)
            .offset(x: -1, y: -1)
        })
  }

  @ViewBuilder
  func shape(size: CGSize) -> some View {
    switch buttonShape {
    case .round:
      Circle()
            .stroke(Color.purple, lineWidth: 2)
        .frame(
          width: max(size.width, size.height),
          height: max(size.width, size.height))
        .offset(x: -1)
        .offset(y: -max(size.width, size.height) / 2 +
          min(size.width, size.height) / 2)// configures the size and shape
    case .capsule:
      Capsule()
            .stroke(Color.pink, lineWidth: 2)
    }
  }
}

struct EmbossedButton_Previews: PreviewProvider {
  static var previews: some View {
    Button("History") {}
      .fontWeight(.bold)
      .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
      .padding(40)
      .previewLayout(.sizeThatFits)
  }
}
//Embossed button handles the shape and size of the buttons, handles the over all design
