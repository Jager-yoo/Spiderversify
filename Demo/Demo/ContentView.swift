//
//  ContentView.swift
//  Demo
//
//  Created by 유재호 on 2023/07/17.
//

import SwiftUI
import Spiderversify

struct ContentView: View {

  @State private var glitching = false

  var body: some View {
    Text("Spiderversify")
      .spiderversify($glitching, duration: 2, glitchInterval: 0.12)
      .font(.title)
      .onTapGesture {
        glitching = true
      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
