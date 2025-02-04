//
//  RaisedButton.swift
//  HIITFit
//
//  Created by Curtis Fisher on 2/2/25.
//



import SwiftUI

struct RaisedButton: View {
  let buttonText: String
  let action: () -> Void

  var body: some View {
    Button(action: {
      action()
    }, label: {
      Text(buttonText)
        .raisedButtonTextStyle()
    })
    .buttonStyle(.raised)
  }
}

extension ButtonStyle where Self == RaisedButtonStyle {
  static var raised: RaisedButtonStyle {
    .init()
  }
}

struct RaisedButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(maxWidth: .infinity)
      .padding([.top, .bottom], 12)
      .background(
        
        Capsule()
            .foregroundColor(Color.white.opacity(0.2))
            .shadow(color: .purple, radius: 4, x: 6, y: 6)
          .shadow(color: Color.white, radius: 4, x: -6, y: -6))
  }
}

extension Text {
  func raisedButtonTextStyle() -> some View {
    self
    .font(.body)
    .fontWeight(.bold)
  }
}

struct RaisedButton_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
        RaisedButton(buttonText: "Get Started") {
        print("Hello World")
        }
      .buttonStyle(.raised)
      .padding(20)
    }
    .background(Color("background"))
    .previewLayout(.sizeThatFits)
  }
}
// this section is responsible for the button styling and shdaing, also handles giving it such effects as raised or on hover 
