//
//  HIITFitApp.swift
//  HIITFit
//
//  Created by Curtis Fisher on 1/24/25.
//

import SwiftUI

@main
struct HIITFitApp: App {
  @StateObject private var historyStore = HistoryStore()

  var body: some Scene {
    WindowGroup {
      ContentView()
            
        .environmentObject(historyStore)
        .onAppear {
          print(URL.documentsDirectory)
        }// prints the URL of the apps documents to the console
        .alert(isPresented: $historyStore.loadingError) {
          Alert(
            title: Text("History"),
            message: Text(
              """
              Unfortunately we can’t load your past history.
              Email support:
                support@xyz.com
              """))
        }// shows the alert view for if the loading error is true 
    }
  }// the window group allows the user to open multipled windows of the application
}
