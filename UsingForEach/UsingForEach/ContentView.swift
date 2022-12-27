
import SwiftUI

struct ContentView: View {
    let goats = ["Messi", "Ronaldo", "Neymar", "Maradona", "Pele"]
    @State private var selectedGoat = "Messi"
    var body: some View {
        NavigationView {
            VStack{
                Text("Goat Selection Form")
                Form {
                    //selectedGoat is a two way binding
                    Picker("Select your GOAT", selection: $selectedGoat) {
                        //id is a way to identify each elements of an array uniquely. Here, each property of goats is unique
                        ForEach(goats, id: \.self) { goat in
                            Text(goat)
                        }
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
