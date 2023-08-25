//
//  LogoView.swift
//  CostCalculator
//
//  Created by MMH on 25/8/23.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack {
            Text("Cost".uppercased())
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.black)
            
            Image(systemName: "dollarsign.square.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.black)
            
            Text("calc".uppercased())
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.black)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
