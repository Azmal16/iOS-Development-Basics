//
//  HealthViewModel.swift
//  HealthKitDemo
//
//  Created by MMH on 3/1/25.
//

import SwiftUI
import Combine
import WatchConnectivity

class HealthViewModel: NSObject, ObservableObject, WCSessionDelegate {
    static let shared = HealthViewModel()
    @Published var realTimeHeartRate: Double = 0
    
    private var healthManager = HealthManager()
    
    func requestAuthorization() {
        healthManager.requestAuthorization { success in
            if !success {
                print("Failed to authorize HealthKit.")
            }
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        if let heartRate = message["heartRate"] as? Double {
            DispatchQueue.main.async {
                self.realTimeHeartRate = heartRate
            }
        }
    }
    
    func setupWatchConnectivity() {
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    // MARK: - WCSessionDelegate Protocol Stubs
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        // This method is required but can be left empty
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        // This method is required but can be left empty
        // You can also call session.activate() if needed
        WCSession.default.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith state: WCSessionActivationState, error: Error?) {
        if let error = error {
            print("WCSession activation failed with error: \(error.localizedDescription)")
        } else {
            print("WCSession activated with state: \(state.rawValue)")
        }
    }
}
