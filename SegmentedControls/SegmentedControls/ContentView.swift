//
//  ContentView.swift
//  SegmentedControls
//
//  Created by MMH on 6/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isTrue = true
    var body: some View {
        VStack {
            Picker("What is your favorite color?", selection: $isTrue) {
                Text("True").tag(true)
                Text("False").tag(false)
                
            }
            .pickerStyle(.segmented)
            isTrue ? Text("True"):Text("False")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
