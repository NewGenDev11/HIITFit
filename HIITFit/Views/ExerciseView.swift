//
//  ExerciseView.swift
//  HIITFit
//
//  Created by Curtis Fisher on 1/24/25.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @Binding var selectedTab: Int
    @State private var rating = 0
    @State private var showHistory = false
    @State private var showSuccess = false

    let index: Int
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }

    var startButton: some View {
        Button("Start Exercise") {}
    }
    var doneButton: some View {
        Button("Done") {
            if lastExercise {
               showSuccess.toggle()
             } else {
               selectedTab += 1
             }
           }
         }
    var exercise: Exercise {
    Exercise.exercises[index]
    }
    let interval: TimeInterval = 30
    var body: some View {
        GeometryReader { geometry in
            VStack{

                HeaderView(selectedTab: $selectedTab,
                    titleText: Exercise.exercises[index].exerciseName
                )

                VideoPlayerView(videoName: exercise.videoName)
                    .frame(height: geometry.size.height * 0.45)
                
                
                
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))
                HStack(spacing: 150){
                    startButton
                    doneButton
                        .sheet(isPresented: $showSuccess) {
                            SuccessView(selectedTab: $selectedTab)
                        }
                }
                
                RatingView(rating: $rating)
                    .padding()
                
                Spacer()
                Button("History") {
                showHistory.toggle()
                }
                .sheet(isPresented: $showHistory) {
                HistoryView(showHistory: $showHistory)
                }
                .padding()
            }
        }
    }
}

struct ExcersiseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(3), index: 3)
    }
}

