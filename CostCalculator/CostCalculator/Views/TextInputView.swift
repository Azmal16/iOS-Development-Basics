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
            
            
            VStack {
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color(UIColor(red: 0.83, green: 0.32, blue: 0.13, alpha: 1.00)))
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                
                ScrollView() {
                    VStack(spacing: 25) {
                        Text("Azmal")
                            .foregroundColor(.black)
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
                            .foregroundColor(.black)
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
                            .foregroundColor(.black)
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
                        
                        HStack{
                            
                            Button {
                                calculateCost()
                                hideKeyBoard()
                            } label: {
                                Text("Calculate")
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 8)
                                    .font(.title2)
                                    .frame(height: 44)
                                    .background(Color(UIColor(red: 0.83, green: 0.32, blue: 0.13, alpha: 1.00)))
                                    .foregroundColor(.black)
                                    .cornerRadius(30)
                            }
                        }
                        
                        
                        
                        VStack {
                            HStack {
                                Text("Azmal")
                                    .foregroundColor(isCalculationComplete ? .black :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                                Text(azmalAccount > 0 ? "gets" : "gives")
                                    .foregroundColor(isCalculationComplete ? .black :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                                Text("\(abs(azmalAccount))")
                                    .foregroundColor(isCalculationComplete ? azmalAccount > 0 ? .green : .red :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                                Text("Taka")
                                    .foregroundColor(isCalculationComplete ? .black :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                                
                            }
                            
                            HStack {
                                Text("Mridul")
                                    .foregroundColor(isCalculationComplete ? .black :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                                Text(mridulAccount > 0 ? "gets" : "gives")
                                    .foregroundColor(isCalculationComplete ? .black :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                                Text("\(abs(mridulAccount))")
                                    .foregroundColor(isCalculationComplete ? mridulAccount > 0 ? .green : .red :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                                Text("Taka")
                                    .foregroundColor(isCalculationComplete ? .black :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                            }
                            
                            HStack {
                                Text("Nasif")
                                    .foregroundColor(isCalculationComplete ? .black :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                                Text(nasifAccount > 0 ? "gets" : "gives")
                                    .foregroundColor(isCalculationComplete ? .black :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                                Text("\(abs(nasifAccount))")
                                    .foregroundColor(isCalculationComplete ? nasifAccount > 0 ? .green : .red :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                                Text("Taka")
                                    .foregroundColor(isCalculationComplete ? .black :  Color(UIColor(red: 0.14, green: 0.17, blue: 0.17, alpha: 1.00)))
                                
                            }
                        }.font(.title2)
                        
                        Spacer()
                    }
                    .padding()
                }
            }
            
        }
        .ignoresSafeArea(.all, edges: .top)
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
        mridulAccount = mridulGroceryInt - 2 * perHeadGroceryCost + mridulUtilityInt - perHeadUtilityCost
        nasifAccount = nasifGroceryInt - perHeadGroceryCost + nasifutilityInt - perHeadUtilityCost
        isCalculationComplete = true
    }
    
    func hideKeyBoard() {
        fieldIsFocused = false
    }
    
    func resetToZero() {
        azmalGrocery = ""
        azmalUtility = ""
        mridulGrocery = ""
        mridulUtility = ""
        nasifGrocery = ""
        nasifUtility = ""
        azmalAccount = 0
        mridulAccount = 0
        nasifAccount = 0
        isCalculationComplete = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TextInputView()
    }
}
