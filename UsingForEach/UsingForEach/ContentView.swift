
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //ForEach is used to loop over a sequence to create views
            ForEach((1...10).reversed(), id: \.self) {
                    Text("\($0)…")
                }

                Text("Ready or not, here I come!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
