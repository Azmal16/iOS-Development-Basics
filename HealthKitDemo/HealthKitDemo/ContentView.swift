//
//  ContentView.swift
//  HealthKitDemo
//
//  Created by MMH on 2/1/25.
//

import SwiftUI
import HealthKit


struct ContentView: View {
    @StateObject private var viewModel = HealthViewModel.shared

    var body: some View {
        VStack(spacing: 20) {
            Text("Real-Time Heart Rate")
                .font(.largeTitle)

            Text("\(viewModel.realTimeHeartRate, specifier: "%.1f") bpm")
                .font(.title)

//            Button(action: {
//                // Placeholder for future functionality
//            }) {
//                Text("Health Data")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue)
//                    .cornerRadius(10)
//            }
        }
        .padding()
        .onAppear {
            viewModel.requestAuthorization()
            viewModel.setupWatchConnectivity()
        }
    }
}
