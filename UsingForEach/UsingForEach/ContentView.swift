
import SwiftUI

struct ContentView: View {
    let goats = ["Messi", "Ronaldo", "Neymar", "Maradona", "Pele"]
    @State private var selectedGoat = "Messi"
    var body: some View {
        NavigationView {
            Form {
                Picker("Select your GOAT", selection: $selectedGoat) {
                    ForEach(goats, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
