//
//  ContentView.swift
//  HealthKitDemo
//
//  Created by MMH on 2/1/25.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    @StateObject private var viewModel = HealthViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Health Data")
                .font(.largeTitle)
            
            Text("Steps: \(Int(viewModel.stepCount))")
            Text("Calories Burned: \(Int(viewModel.caloriesBurned)) kCal")
            Text("Current Heart Rate: \(Int(viewModel.currentHeartRate)) bpm")
            Text("Resting Heart Rate: \(Int(viewModel.restingHeartRate)) bpm")
        }
        .padding()
        .onAppear {
            viewModel.requestAuthorization()
        }
    }
}
