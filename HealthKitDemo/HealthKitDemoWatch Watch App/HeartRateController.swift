import HealthKit
import WatchConnectivity

class HeartRateController: ObservableObject {
    private let healthStore = HKHealthStore()
    var heartRateQuery: HKAnchoredObjectQuery?
    @Published var currentHeartRate: Double = 0

    func startHeartRateUpdates() {
        guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate) else { return }

        let query = HKAnchoredObjectQuery(type: heartRateType, predicate: nil, anchor: nil, limit: HKObjectQueryNoLimit) { _, samples, _, _, _ in
            self.handleSamples(samples)
        }

        query.updateHandler = { _, samples, _, _, _ in
            self.handleSamples(samples)
        }

        healthStore.execute(query)
        self.heartRateQuery = query
    }

    func stopHeartRateUpdates() {
        if let query = heartRateQuery {
            healthStore.stop(query)
            heartRateQuery = nil
        }
    }

    private func handleSamples(_ samples: [HKSample]?) {
        guard let samples = samples as? [HKQuantitySample] else { return }
        guard let latestSample = samples.last else { return }
        
        let heartRate = latestSample.quantity.doubleValue(for: HKUnit(from: "count/min"))
        DispatchQueue.main.async {
            self.currentHeartRate = heartRate
        }
        sendHeartRateToiOSApp(heartRate: heartRate)
    }

    private func sendHeartRateToiOSApp(heartRate: Double) {
        guard WCSession.default.isReachable else { return }
        let message: [String: Any] = ["heartRate": heartRate]
        WCSession.default.sendMessage(message, replyHandler: nil) { error in
            print("Error sending heart rate: \(error.localizedDescription)")
        }
    }
}
