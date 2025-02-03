//
//  SuccessView.swift
//  HIITFit
//
//  Created by Curtis Fisher on 1/25/25.
//

import SwiftUI

struct SuccessView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedTab: Int

  var body: some View {
    ZStack {
      VStack {
        Image(systemName: "hand.raised.fill")
            .resizable()
            .frame(width: 75, height: 75)
          .foregroundColor(.purple)
        Text("High Five!")
          .font(.largeTitle)
          .fontWeight(.bold)
        Text("""
          Good job completing all four exercises!
          Remember tomorrow's another day.
          So eat well and get some rest.
          """)
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
      }
      VStack {
        Spacer()
          Button("Continue") {
          dismiss()
              selectedTab = 9
          }
          .padding()
      }
    }
  }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectedTab: .constant(3))
            .presentationDetents([.medium, .large])

    }// this view is responsible for handling the end page exiting message, when clicked continue it allows the user to dismiss the message and go back to the homepage 
}
