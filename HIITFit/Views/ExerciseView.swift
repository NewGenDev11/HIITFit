//
//  ExerciseView.swift
//  HIITFit
//
//  Created by Curtis Fisher on 1/24/25.
//



import SwiftUI
// exercise view gets read and write access to the HistoryStore without passing history from the contentview to ExerciseView as a parameter
struct ExerciseView: View {
  @EnvironmentObject var history: HistoryStore
  @State private var showHistory = false
  @State private var showSuccess = false
  @State private var timerDone = false
  @State private var showTimer = false // State properties that when the properties change and update to the view being depeneded upon that propery

  @Binding var selectedTab: Int
  let index: Int

  var exercise: Exercise {
    Exercise.exercises[index]
  }
  var lastExercise: Bool {
    index + 1 == Exercise.exercises.count
  }

  var startButton: some View {
    RaisedButton(buttonText: "Start Exercise") {
      showTimer.toggle()
    }
  }
// history.addDoneExercise() adds the exercise name to the HistoryStore
  var doneButton: some View {
    Button("Done") {
      history.addDoneExercise(Exercise.exercises[index].exerciseName)
      timerDone = false
      showTimer.toggle()

      if lastExercise {
        showSuccess.toggle()
      } else {
        selectedTab += 1
      }// if Done button is enabled then timerDone is now true so its reset to false to diable to Done button again
    }
  }

  var body: some View {
    GeometryReader { geometry in
      VStack(spacing: 0) {
        HeaderView(
          selectedTab: $selectedTab,
          titleText: Exercise.exercises[index].exerciseName)
          .padding(.bottom)

        VideoPlayerView(videoName: exercise.videoName)
          .frame(height: geometry.size.height * 0.45)

        HStack(spacing: 150) {
          startButton
          doneButton
            .disabled(!timerDone)
            .sheet(isPresented: $showSuccess) {
              SuccessView(selectedTab: $selectedTab)
                .presentationDetents([.medium, .large])
            }// timer done is disabled while timerDone is fals
        }
        .font(.title3)
        .padding()

        if showTimer {
          TimerView(
            timerDone: $timerDone,
            size: geometry.size.height * 0.07)
        } // inclduing the timerview when showTimer is true and passes it a binding to the @state property timerDone and handles font size

        Spacer()
        RatingView(exerciseIndex: index)
          .padding()// passes the current exercise index

        historyButton
          .sheet(isPresented: $showHistory) {
            HistoryView(showHistory: $showHistory)
          }
          .padding(.bottom)
      }
    }
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

struct ExerciseView_Previews: PreviewProvider {
  static var previews: some View {
      ExerciseView(selectedTab: .constant(0), index: 0)
      .environmentObject(HistoryStore())
  }
}
