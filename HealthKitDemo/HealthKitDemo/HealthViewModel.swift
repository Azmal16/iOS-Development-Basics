//
//  HealthViewModel.swift
//  HealthKitDemo
//
//  Created by MMH on 3/1/25.
//

import Foundation

final class HealthViewModel: ObservableObject {
    private let healthManager = HealthManager()
    
    @Published var stepCount: Double = 0
    @Published var caloriesBurned: Double = 0
    @Published var currentHeartRate: Double = 0
    @Published var restingHeartRate: Double = 0
    
    func requestAuthorization() {
        healthManager.requestAuthorization { [weak self] success in
            guard success else { return }
            self?.fetchHealthData()
        }
    }
    
    private func fetchHealthData() {
        healthManager.fetchStepCount { [weak self] steps in
            DispatchQueue.main.async {
                self?.stepCount = steps
            }
        }
        
        healthManager.fetchCaloriesBurned { [weak self] calories in
            DispatchQueue.main.async {
                self?.caloriesBurned = calories
            }
        }
        
        healthManager.fetchCurrentHeartRate { [weak self] heartRate in
            DispatchQueue.main.async {
                self?.currentHeartRate = heartRate ?? 0
            }
        }
        
        healthManager.fetchRestingHeartRate { [weak self] restingRate in
            DispatchQueue.main.async {
                self?.restingHeartRate = restingRate ?? 0
            }
        }
    }
}
