//
//  ContentView.swift
//  StateProperties
//
//  Created by MMH on 28/12/22.
//

import SwiftUI

struct ContentView: View {
    
    //UI gets changed accordig to the value of this property
    @State var name = ""
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00))
            VStack{
                
                Text("Please Enter Your Name:")
                    .font(.system(size: 20))
                    .colorInvert()
                    .padding(5)
                //$ sign indicates two-way binding
                //View code both reads and writes the value of "name"
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                if(name != "")
                {
                    Text("Hello \(name)!")
                        .font(.system(size: 20))
                        .colorInvert()
                }
                
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
