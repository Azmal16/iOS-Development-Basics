import HealthKit

class HealthManager {
    private let healthStore = HKHealthStore()
    
    // Request authorization
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        let readTypes: Set<HKObjectType> = [
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
            HKObjectType.quantityType(forIdentifier: .heartRate)!,
            HKObjectType.quantityType(forIdentifier: .restingHeartRate)!
        ]
        
        healthStore.requestAuthorization(toShare: nil, read: readTypes) { success, error in
            completion(success)
        }
    }
    
    // Fetch step count
    func fetchStepCount(completion: @escaping (Double) -> Void) {
        guard let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount) else { return }
        
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now)
        
        let query = HKStatisticsQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, statistics, _ in
            let stepCount = statistics?.sumQuantity()?.doubleValue(for: .count()) ?? 0
            completion(stepCount)
        }
        healthStore.execute(query)
    }
    
    // Fetch active energy burned
    func fetchCaloriesBurned(completion: @escaping (Double) -> Void) {
        guard let energyType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned) else { return }
        
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now)
        
        let query = HKStatisticsQuery(quantityType: energyType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, statistics, _ in
            let caloriesBurned = statistics?.sumQuantity()?.doubleValue(for: .kilocalorie()) ?? 0
            completion(caloriesBurned)
        }
        healthStore.execute(query)
    }
    
    // Fetch current heart rate
    func fetchCurrentHeartRate(completion: @escaping (Double?) -> Void) {
        guard let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate) else { return }
        
        let now = Date()
        let predicate = HKQuery.predicateForSamples(withStart: now.addingTimeInterval(-10), end: now)
        
        let query = HKSampleQuery(sampleType: heartRateType, predicate: predicate, limit: 1, sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)]) { _, samples, _ in
            guard let sample = samples?.first as? HKQuantitySample else {
                completion(nil)
                return
            }
            let heartRate = sample.quantity.doubleValue(for: HKUnit(from: "count/min"))
            completion(heartRate)
        }
        healthStore.execute(query)
    }
    
    // Fetch resting heart rate
    func fetchRestingHeartRate(completion: @escaping (Double?) -> Void) {
        guard let restingType = HKQuantityType.quantityType(forIdentifier: .restingHeartRate) else { return }
        
        let query = HKSampleQuery(sampleType: restingType, predicate: nil, limit: 1, sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)]) { _, samples, _ in
            guard let sample = samples?.first as? HKQuantitySample else {
                completion(nil)
                return
            }
            let restingRate = sample.quantity.doubleValue(for: HKUnit(from: "count/min"))
            completion(restingRate)
        }
        healthStore.execute(query)
    }
}
