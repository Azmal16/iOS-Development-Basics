//
//  NavigationBar.swift
//  CostCalculator
//
//  Created by MMH on 24/8/23.
//

import SwiftUI

struct NavigationBarView: View {
    //MARK: - PROPERTIES
    
    
    //MARK: - BODY
    var body: some View {
        HStack {
//            Button(action: {}, label: {
//                Image(systemName: "magnifyingglass")
//                    .font(.title)
//                    .foregroundColor(.black)
//            }) //: BUTTON
            
            Spacer()
            Text("Cost".uppercased())
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.black)
            
            Image(systemName: "dollarsign.circle.fill")
                .font(.largeTitle.weight(.black))
                .foregroundColor(.black)
            
            Text("calc".uppercased())
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.black)
            
            Spacer()
            //dollarsign.circle.fill
//            Button(action: {}, label: {
//                Image(systemName: "cart")
//                    .font(.title)
//                    .foregroundColor(.black)
//            }) //: BUTTON
            
        } //: HSTACK
    }
}


//MARK: - PREVIEW
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
