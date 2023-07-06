import SwiftUI

struct ContentView: View {
    @State private var scrollOffset: CGFloat = 0
    @State private var scrollViewProxy: ScrollViewProxy?
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(0..<50) { index in
                            Text("Item \(index)")
                                .frame(width: 200, height: 50)
                                .background(Color.yellow)
                                .id(index)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .onAppear {
                        scrollViewProxy = proxy
                    }
                }
            }
            
            HStack {
                Button(action: scrollToTop) {
                    Text("Scroll Up")
                        .foregroundColor(.green)
                }
                .padding()
                .background(Color.white)
                
                Button(action: scrollToBottom) {
                    Text("Scroll Down")
                        .foregroundColor(.red)
                }
                .padding()
                .background(Color.white)
            }
        }
    }
    
    func scrollToTop() {
        scrollViewProxy?.scrollTo(15, anchor: .top)
    }
    
    func scrollToBottom() {
        scrollViewProxy?.scrollTo(49, anchor: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
