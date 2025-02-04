//
//  TimerView.swift
//  HIITFit
//
//  Created by Curtis Fisher on 1/31/25.
//


import SwiftUI

struct CountdownView: View {
  let date: Date
  @Binding var timeRemaining: Int// Binding var of timeRemaining passed from the parent view to the child view Binding makes a two way connection
  let size: Double

  var body: some View {
    Text("\(timeRemaining)")
      .font(.system(size: size, design: .rounded))
      .padding()
      .onChange(of: date) { _ in
        timeRemaining -= 1
      }
  }
}

struct TimerView: View {
  @State private var timeRemaining: Int = 3 // start of time where the child view establish an integer value for start time, the state manages and updates the view whenever this state property changes
  @Binding var timerDone: Bool
  let size: Double

  var body: some View {
    TimelineView(
      .animation(
        minimumInterval: 1.0,
        paused: timeRemaining <= 0)) { context in
          CountdownView(
            date: context.date,
            timeRemaining: $timeRemaining,
            size: size)
    } // pauses when the time is less then or equal to zero
    .onChange(of: timeRemaining) { _ in
      if timeRemaining < 1 {
        timerDone = true
      }// the onchange updates timeReamining here and inside the TimerView
    }// if time remaining variable is less than one then timer done variable boolean is true
  }
}// and when the time has reached its <= 0 the timerDone is set to true and the Done button is now enabled for use

struct TimerView_Previews: PreviewProvider {
  static var previews: some View {
    TimerView(timerDone: .constant(false), size: 90)
  }
}
