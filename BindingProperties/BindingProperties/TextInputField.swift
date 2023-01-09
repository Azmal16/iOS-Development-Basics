//
//  TextInputField.swift
//  BindingProperties
//
//  Created by MMH on 9/1/23.
//

import SwiftUI

struct TextInputField: View {
    
    @Binding var userInput: String
    
    var body: some View {
        TextField("Enter Blue", text: $userInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
    }
}


