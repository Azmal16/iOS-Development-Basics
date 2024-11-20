import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    private var motionManager = CMMotionManager()
    
    @Published var pitch: Double = 0.0
    @Published var roll: Double = 0.0
    @Published var yaw: Double = 0.0
    let radToDegConst = 57.3

    func checkIfHorizontal() {
        
        guard motionManager.isDeviceMotionAvailable else { return }

        motionManager.deviceMotionUpdateInterval = 0.1
        motionManager.startDeviceMotionUpdates(to: .main) { motion, error in
            guard let motion = motion, error == nil else { return }

            // Check the pitch and roll
            let pitch = abs(motion.attitude.pitch) // Radians
            let roll = abs(motion.attitude.roll)   // Radians
            let yaw = abs(motion.attitude.yaw)   // Radians

            self.pitch = pitch * self.radToDegConst
            self.roll = roll * self.radToDegConst
            self.yaw = yaw * self.radToDegConst
                        
            self.motionManager.stopDeviceMotionUpdates()
        }
    }
}
