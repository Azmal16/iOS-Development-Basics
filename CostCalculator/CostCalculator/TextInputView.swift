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
    @FocusState private var fieldIsFocused: Bool
    
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
                        TextField("Enter Grocery Cost (Tk)", text: $azmalGrocery)
                        TextField("Enter Unilty Cost (Tk)", text: $azmalUtility)
                    }
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .frame(width: 350)
                    .focused($fieldIsFocused)
                    
                    Text("Mridul")
                        .foregroundColor(.white)
                        .font(.title)
                    
                    Group {
                        TextField("Enter Grocery Cost (Tk)", text: $mridulGrocery)
                        TextField("Enter Unilty Cost (Tk)", text: $mridulUtility)
                    }
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .frame(width: 350)
                    .focused($fieldIsFocused)
                    
                    
                    Text("Nasif")
                        .foregroundColor(.white)
                        .font(.title)
                    
                    Group {
                        TextField("Enter Grocery Cost (Tk)", text: $nasifGrocery)
                        TextField("Enter Unilty Cost (Tk)", text: $nasifUtility)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    Button("Done") {
                                        hideKeyBoard()
                                    }
                                }
                            }
                        
                    }
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .frame(width: 350)
                    .focused($fieldIsFocused)
                    
                    Button(action: {
                        calculateCost()
                        hideKeyBoard()
                        self.isCalculationComplete = true
                    }) {
                        Text("Calculate")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(12)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                    
                    VStack {
                        HStack {
                            Text("Azmal")
                                .foregroundColor(isCalculationComplete ? .white :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                            Text(azmalAccount > 0 ? "gets" : "gives")
                                .foregroundColor(isCalculationComplete ? .white :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                            Text("\(abs(azmalAccount))")
                                .foregroundColor(isCalculationComplete ? azmalAccount > 0 ? .green : .red :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
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
                            Text("Taka")
                                .foregroundColor(isCalculationComplete ? .white :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                            
                        }
                    }.font(.title2)
                    
                    Spacer()
                }
                .padding()
            }
            
        }
    }
}

extension TextInputView {
    
    func calculateCost() {
        let azmalGroceryInt = Int(azmalGrocery) ?? 0
        let mridulGroceryInt = Int(mridulGrocery) ?? 0
        let nasifGroceryInt = Int(nasifGrocery) ?? 0
        
        let azmalUtilityInt = Int(azmalUtility) ?? 0
        let mridulUtilityInt = Int(mridulUtility) ?? 0
        let nasifutilityInt = Int(nasifUtility) ?? 0
        
        let perHeadGroceryCost = (azmalGroceryInt + mridulGroceryInt + nasifGroceryInt) / 4
        let perHeadUtilityCost = (azmalUtilityInt + mridulUtilityInt + nasifutilityInt) / 3
        
        azmalAccount = azmalGroceryInt - perHeadGroceryCost + azmalUtilityInt - perHeadUtilityCost
        mridulAccount = mridulGroceryInt - perHeadGroceryCost + mridulUtilityInt - perHeadUtilityCost
        nasifAccount = nasifGroceryInt - perHeadGroceryCost + nasifutilityInt - perHeadUtilityCost
    }
    
    func hideKeyBoard() {
        fieldIsFocused = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TextInputView()
    }
}
