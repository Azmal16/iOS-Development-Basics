//
//  AppDelegate.swift
//  HealthKitDemo
//
//  Created by MMH on 8/1/25.
//


import UIKit
import WatchConnectivity

//@main
class AppDelegate: UIResponder, UIApplicationDelegate, WCSessionDelegate {

    // This is called when the app finishes launching.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
        return true
    }

    // MARK: - WCSessionDelegate Methods

    // This method is required but can remain empty if not needed.
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print("WCSession activation failed with error: \(error.localizedDescription)")
        } else {
            print("WCSession activated with state: \(activationState.rawValue)")
        }
    }

    // This method is only for iOS-to-watch state changes.
    func sessionDidBecomeInactive(_ session: WCSession) {
        // Handle the session becoming inactive if necessary.
        print("WCSession did become inactive.")
    }

    // This method is only for iOS-to-watch state changes.
    func sessionDidDeactivate(_ session: WCSession) {
        // Restart the session if needed.
        WCSession.default.activate()
        print("WCSession did deactivate.")
    }

    // Optional: Handle receiving a message from the watch.
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        print("Received message from watch: \(message)")

        if let heartRate = message["heartRate"] as? Double {
            DispatchQueue.main.async {
                HealthViewModel.shared.realTimeHeartRate = heartRate
            }
        }
    }
}
