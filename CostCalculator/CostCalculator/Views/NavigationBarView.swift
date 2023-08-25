//
//  NavigationBar.swift
//  CostCalculator
//
//  Created by MMH on 24/8/23.
//

import SwiftUI

struct NavigationBarView: View {
    //MARK: - PROPERTIES
    @State private var isAnimated: Bool = false
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.black)
            
            Spacer()
            
            LogoView()
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeIn(duration: 0.5)) {
                        isAnimated.toggle()
                    }
                })
            
            Spacer()
            
            Image(systemName: "arrow.counterclockwise")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.black)
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
