import Foundation
import WatchConnectivity
import HealthKit


class HealthManager {
    let healthStore = HKHealthStore()
    private var heartRateQuery: HKAnchoredObjectQuery?

    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
            completion(false)
            return
        }

        let typesToRead: Set = [heartRateType]
        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, _ in
            completion(success)
        }
    }
}

