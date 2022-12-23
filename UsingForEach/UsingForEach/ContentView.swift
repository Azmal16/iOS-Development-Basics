//
//  ContentView.swift
//  UsingForEach
//
//  Created by MMH on 23/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach((1...10).reversed(), id: \.self) {
                    Text("\($0)…")
                }

                Text("Ready or not, here I come!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
