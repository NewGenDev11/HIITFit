
//
//  WelcomeView.swift
//  HIITFit
//
//  Created by Curtis Fisher on 1/24/25.
//



import SwiftUI

struct WelcomeView: View {
  @EnvironmentObject var historyStore: HistoryStore
  @State private var showHistory = false
  @Binding var selectedTab: Int

  var body: some View {
    GeometryReader { geometry in
      VStack {
        HeaderView(
          selectedTab: $selectedTab,
          titleText: "Welcome")
        Spacer()
        // container view
        ContainerView {
          ViewThatFits {
            VStack {
              WelcomeView.images
              WelcomeView.welcomeText
              getStartedButton
              Spacer()
              historyButton
            }
            VStack {
              WelcomeView.welcomeText
              getStartedButton
              Spacer()
              historyButton
            }
          }
        }
        .frame(height: geometry.size.height * 0.8)
      }
      .sheet(isPresented: $showHistory) {
        HistoryView(showHistory: $showHistory)
      }
    }
  }

  var getStartedButton: some View {
      Button(action: { selectedTab = 0 }) {
      Text("Get Started")
      .raisedButtonTextStyle()
      }
      .buttonStyle(.raised)
      .padding()
  }

  var historyButton: some View {
    Button(
      action: {
        showHistory = true
      }, label: {
        Text("History")
          .fontWeight(.bold)
          .padding([.leading, .trailing], 5)
      })
      .padding(.bottom, 10)
      .buttonStyle(EmbossedButtonStyle())
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView(selectedTab: .constant(9))
  }
}
// the welcomeview is responsible for the first ui page and welcoming the user, it also handles the images into the vstack
