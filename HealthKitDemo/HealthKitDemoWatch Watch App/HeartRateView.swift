//
//  HeartRateView.swift
//  HealthKitDemo
//
//  Created by MMH on 8/1/25.
//


import SwiftUI

struct HeartRateView: View {
    @ObservedObject var controller = HeartRateController()

    var body: some View {
        VStack(spacing: 10) {
            Text("Heart Rate")
                .font(.headline)
            Text("\(controller.currentHeartRate, specifier: "%.1f") bpm")
                .font(.largeTitle)

            Button(action: {
                if controller.heartRateQuery != nil {
                    controller.stopHeartRateUpdates()
                } else {
                    controller.startHeartRateUpdates()
                }
            }) {
                Text(controller.heartRateQuery != nil ? "Stop Monitoring" : "Start Monitoring")
                    .font(.headline)
                    .padding()
                    .background(controller.heartRateQuery != nil ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}
