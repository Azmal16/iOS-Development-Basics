//
//  ResultView.swift
//  CostCalculator
//
//  Created by MMH on 25/8/23.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isCalculationComplete: Bool
    @Binding var azmalAccount: Int
    @Binding var mridulAccount: Int
    @Binding var nasifAccount: Int
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00))
            
            VStack {
                Spacer()

                HStack {
                    Text("Azmal")
                        .foregroundColor(isCalculationComplete ? .white :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                    Text(azmalAccount > 0 ? "gets" : "gives")
                        .foregroundColor(isCalculationComplete ? .white :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                    Text("\(abs(azmalAccount))")
                        .foregroundColor(isCalculationComplete ? azmalAccount > 0 ? .green : .red :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                        .font(.system(size: 40))
                    Text("Taka")
                        .foregroundColor(isCalculationComplete ? .white :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                    
                }
                
                HStack {
                    Text("Mridul")
                        .foregroundColor(isCalculationComplete ? .white :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                    Text(mridulAccount > 0 ? "gets" : "gives")
                        .foregroundColor(isCalculationComplete ? .white :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                    Text("\(abs(mridulAccount))")
                        .foregroundColor(isCalculationComplete ? mridulAccount > 0 ? .green : .red :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                        .font(.system(size: 40))
                    Text("Taka")
                        .foregroundColor(isCalculationComplete ? .white :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                }
                
                HStack {
                    Text("Nasif")
                        .foregroundColor(isCalculationComplete ? .white :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                    Text(nasifAccount > 0 ? "gets" : "gives")
                        .foregroundColor(isCalculationComplete ? .white :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                    Text("\(abs(nasifAccount))")
                        .foregroundColor(isCalculationComplete ? nasifAccount > 0 ? .green : .red :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                        .font(.system(size: 40))
                    Text("Taka")
                        .foregroundColor(isCalculationComplete ? .white :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                    
                }
                
                Button {
                    dismiss()
                } label: {
                    Text("OK")
                        .padding(.horizontal, 22)
                        .padding(.vertical, 8)
                        .font(.system(size: 22))
                        .frame(height: 44)
                        .background(Color(UIColor(red: 0.83, green: 0.32, blue: 0.13, alpha: 1.00)))
                        .foregroundColor(.black)
                        .cornerRadius(30)
                }.padding()
                Spacer()
                
            }.font(.title)
        }.ignoresSafeArea(.all, edges: .all)
    }
}

//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView(isCalculationComplete: true, azmalAccount: 1200, mridulAccount: 500, nasifAccount: -500)
//    }
//}
