//
//  HistoryStore.swift
//  HIITFit
//
//  Created by Curtis Fisher on 1/25/25.
//


import Foundation
import SwiftUI

struct ExerciseDay: Identifiable {
  let id = UUID()
  let date: Date
  var exercises: [String] = []
}

class HistoryStore: ObservableObject {
  @Published var exerciseDays: [ExerciseDay] = []
  @Published var loadingError = false
    // marked as published variables so whenever they change it publishes to any subscribers
  enum FileError: Error {
    case loadFailure
    case saveFailure
  } // enum responisble for defining the case for load Failure and save Failure

  init() {
    #if DEBUG
    // createDevData()
    #endif
    do {
      try load()
    } catch {
      loadingError = true
    } // error handling for if file is not loadable
  }

  var dataURL: URL {
    URL.documentsDirectory
      .appendingPathComponent("history.plist")
  }// file path for saving and wrting history to the application

  func load() throws {
    guard let data = try? Data(contentsOf: dataURL) else {
      return
    } // this try nil if the operation fails, using guard, it allows you to jump out of a method if the condition is not met
    do {
      let plistData = try PropertyListSerialization.propertyList(
        from: data,
        options: [],
        format: nil)
      let convertedPlistData = plistData as? [[Any]] ?? []
      exerciseDays = convertedPlistData.map {
        ExerciseDay(
          date: $0[1] as? Date ?? Date(),
          exercises: $0[2] as? [String] ?? [])
      }
    } catch {
        throw FileError.loadFailure
    }
  } // function allows us to load it back everytime

  func save() throws {
    let plistData = exerciseDays.map {
      [$0.id.uuidString, $0.date, $0.exercises]
    }
    do {
      let data = try PropertyListSerialization.data(
        fromPropertyList: plistData,
        format: .binary,
        options: .zero)
      try data.write(to: dataURL, options: .atomic)
    } catch {
      throw FileError.saveFailure
    }
  } // converts the history to a serialized property list format the result is a datatype which bufferes bytes and we write to the disk using the URL earlier

  func addDoneExercise(_ exerciseName: String) {
    let today = Date()
    if let firstDate = exerciseDays.first?.date,
      today.isSameDay(as: firstDate) { // means that first is an option and can contain nil
      exerciseDays[0].exercises.append(exerciseName)
    } else {
      exerciseDays.insert(
        ExerciseDay(date: today, exercises: [exerciseName]),
        at: 0)
    }
    do {
      try save()
    } catch {
      fatalError(error.localizedDescription)
    }
  } // this function handles the adding of the exercises with the moest users most recent exercies date
} // the if statement handles if today is a new day  create the excerciseDay object and insert it at the beginning of exercise array
