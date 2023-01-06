//
//  ContentView.swift
//  SegmentedControls
//
//  Created by MMH on 6/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var superHero = SuperHeroNames.ironMan.rawValue
    @State private var imageName = imageNameDict[SuperHeroNames.ironMan.rawValue]
    
    var body: some View {
        VStack {
            Picker("", selection: $superHero) {
                
                ForEach(SuperHeroNames.allCases, id: \.rawValue) { option in
                    Text(option.rawValue).tag(option)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 300, height: 45)
            .padding()
            .onChange(of: superHero) {value in
                imageName = imageNameDict[value] ?? ""
            }
            
            Spacer()
            
            Image(imageName ?? "")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
