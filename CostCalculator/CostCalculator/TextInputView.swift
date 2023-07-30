import SwiftUI

struct TextInputView: View {
    
    @State private var azmalGrocery = ""
    @State private var azmalUtility = ""
    @State private var mridulGrocery = ""
    @State private var mridulUtility = ""
    @State private var nasifGrocery = ""
    @State private var nasifUtility = ""
    @State private var azmalAccount = 0
    @State private var mridulAccount = 0
    @State private var nasifAccount = 0
    @State private var isCalculationComplete = false
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)).edgesIgnoringSafeArea(.all)
            
            ScrollView() {
                VStack(spacing: 25) {
                    
                    HStack {
                        Image(systemName: "house")
                            .font(.largeTitle.weight(.black))
                        .foregroundColor(.white)
                        VStack {
                            Text("Cost")
                                .foregroundColor(.white)
                            .font(.title2)
                            Text("Calculator")
                                .foregroundColor(.white)
                            .font(.title2)
                        }
                    }
                    Text("Azmal")
                        .foregroundColor(.white)
                        .font(.title)
                    Group {
                        TextField("Enter Grocery Cost", text: $azmalGrocery)
                        TextField("Enter Unilty Cost", text: $azmalUtility)
                    }
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    
                    
                    Text("Mridul")
                        .foregroundColor(.white)
                        .font(.title)
                    
                    Group {
                        TextField("Enter Grocery Cost", text: $mridulGrocery)
                        TextField("Enter Unilty Cost", text: $mridulUtility)
                    }
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    
                    Text("Nasif")
                        .foregroundColor(.white)
                        .font(.title)
                    
                    Group {
                        TextField("Enter Grocery Cost", text: $nasifGrocery)
                        TextField("Enter Unilty Cost", text: $nasifUtility)
                    }
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    
                    Button(action: {
                        let perHeadGroceryCost = (Int(azmalGrocery) ?? 0 + Int(mridulGrocery) ?? 0 + Int(nasifGrocery) ?? 0) / 4
                        let perHeadUtilityCost = (Int(azmalUtility) ?? 0 + Int(mridulUtility) ?? 0 + Int(nasifUtility) ?? 0) / 3
                        azmalAccount = Int(azmalGrocery) ?? 0 - perHeadGroceryCost + Int(azmalUtility) ?? 0 - perHeadUtilityCost
                        mridulAccount = Int(mridulGrocery) ?? 0 - perHeadGroceryCost + Int(mridulUtility) ?? 0 - perHeadUtilityCost
                        nasifAccount = Int(nasifGrocery) ?? 0 - perHeadGroceryCost + Int(nasifUtility) ?? 0 - perHeadUtilityCost
                        self.isCalculationComplete = true
                    }) {
                        Text("Calculate")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                    Group {
                        Text("Azmal: \(azmalAccount)")
                        Text("Mridul: \(mridulAccount)")
                        Text("Nasif: \(nasifAccount)")
                    }.foregroundColor(isCalculationComplete ? .white :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                    Spacer()
                }
                .padding()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TextInputView()
    }
}
