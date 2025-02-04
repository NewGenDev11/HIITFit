//
//  Exercise.swift
//  HIITFit
//
//  Created by Curtis Fisher on 1/24/25.
//



import Foundation

struct Exercise {
  let exerciseName: String
  let videoName: String

  enum ExerciseEnum: String {
    case squat = "Squat"
    case stepUp = "Step Up"
    case burpee = "Burpee"
    case sunSalute = "Sun Salute"
  }
}

extension Exercise {
  static let exercises = [
    Exercise(
      exerciseName: ExerciseEnum.squat.rawValue,
      videoName: "squat"),
    Exercise(
      exerciseName: ExerciseEnum.stepUp.rawValue,
      videoName: "step-up"),
    Exercise(
      exerciseName: ExerciseEnum.burpee.rawValue,
      videoName: "burpee 2"),
    Exercise(
      exerciseName: ExerciseEnum.sunSalute.rawValue,
      videoName: "sun-salute 2")
  ]

  static let names: [String] = [
    ExerciseEnum.squat.rawValue,
    ExerciseEnum.stepUp.rawValue,
    ExerciseEnum.burpee.rawValue,
    ExerciseEnum.sunSalute.rawValue
  ]
}
