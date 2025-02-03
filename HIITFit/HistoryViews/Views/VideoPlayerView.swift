//
//  VideoPlayerView.swift
//  HIITFit
//
//  Created by Curtis Fisher on 1/24/25.
//

import SwiftUI
import AVKit


struct VideoPlayerView: View {
  let videoName: String
  var body: some View {
    if let url = Bundle.main.url(
      forResource: videoName,
      withExtension: "mp4") {
      VideoPlayer(player: AVPlayer(url: url))
    } else {
      Text("Couldn’t find \(videoName).mp4")
        .foregroundColor(.red)
    }
  }
}

struct VideoPlayer_Previews: PreviewProvider {
        static var previews: some View {
            VideoPlayerView(videoName: "squat")
        }
    }
// this view is responsible for uploading the videos mp4 files and handling the error for if the video is not found.
