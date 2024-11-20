
import SwiftUI

struct ContentView: View {
    
    @StateObject private var motionManager = MotionManager()
    @State private var showMessage = false
    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack {
            
            Text("Pitch (Degree): \(motionManager.pitch)")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.red)
            Text("Roll (Degree): \(motionManager.roll)")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.green)
            Text("Yaw (Degree): \(motionManager.yaw)")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.blue)
 
        }
        .onAppear {
            startMonitoring()
        }
        .onDisappear {
            stopMonitoring()
        }
    }
}

extension ContentView {
    private func startMonitoring() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            motionManager.checkIfHorizontal()
        }
    }

    private func stopMonitoring() {
        timer?.invalidate()
        timer = nil
    }
}
