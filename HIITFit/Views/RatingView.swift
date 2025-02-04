//
//  RatingsView.swift
//  HIITFit
//
//  Created by Curtis Fisher on 1/24/25.
//



import SwiftUI

struct RatingView: View {
  let exerciseIndex: Int
  @AppStorage("ratings") private var ratings = "" // holds the variable rating locally and sets up a blank string
  @State private var rating = 0
  let maximumRating = 5

    let onColor = Color.red
  let offColor = Color.gray

  init(exerciseIndex: Int) {
    self.exerciseIndex = exerciseIndex
    let desiredLength = Exercise.exercises.count
    if ratings.count < desiredLength {
      ratings = ratings.padding(
        toLength: desiredLength,
        withPad: "0",
        startingAt: 0)
    }
  }// we recieve the exercise index as a parameter and store it to the RatingView instance/ ratings must have as many characters as you have exercises. if ratings is to short its padded out with zeros

  // swiftlint:disable:next strict_fileprivate
  fileprivate func convertRating()  {// handles the change in the ratings
    let index = ratings.index(
      ratings.startIndex,
      offsetBy: exerciseIndex)
    let character = ratings[index]
    rating = character.wholeNumberValue ?? 0 // this handles extracting a character from a string and converting it into an integer
  }// the filePrivate control modifier allows access to converRating only inside RatingView.swift

  var body: some View {
    HStack {
      ForEach(1 ..< maximumRating + 1, id: \.self) { index in
        Button(action: {
          updateRating(index: index)// ensures each exercise has its own rating
        }, label: {
          Image(systemName: "waveform.path.ecg")
            .foregroundColor(
              index > rating ? offColor : onColor)
            .font(.body)
            
        })
        .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
        .onChange(of: ratings) { _ in
          convertRating()
        }
        .onAppear {
          convertRating()
        }
      }
    }
    .font(.largeTitle)
  }

  func updateRating(index: Int) {
    rating = index
    let index = ratings.index(
      ratings.startIndex,
      offsetBy: exerciseIndex)
    ratings.replaceSubrange(index...index, with: String(rating))
  }// handles replacing the range with a new rating
}

struct RatingView_Previews: PreviewProvider {
  @AppStorage("ratings") static var ratings: String?
  static var previews: some View {
    ratings = nil
    return RatingView(exerciseIndex: 0)
      .previewLayout(.sizeThatFits)
  }
}
