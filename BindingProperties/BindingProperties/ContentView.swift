//
//  ContentView.swift
//  BindingProperties
//
//  Created by MMH on 9/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var userInput = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(userInput.lowercased() == "blue" ? .blue : .gray)
            VStack {
                Text("Enter \"Blue\" to make the screen Blue")
                    .font(.system(size: 20))
                    .bold()
                    .padding()
                TextInputField(userInput: $userInput)
                    .padding()
            }
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
