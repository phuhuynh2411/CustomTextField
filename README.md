# CustomTextField
A UITextField for SwiftUI

## Usage
```swift
struct ContentView: View {
    @State var text: String = "ABCKD"
    @State var isFirstResponder: Bool = true
    var body: some View {
        VStack {
            Text("Hello, World!")
            CustomTextField(text: $text, isFirstResponder: $isFirstResponder)
                .background(Color.gray)
                .frame(height: 50)
            
            Button("Tap me") {
                self.isFirstResponder.toggle()
            }
        }
    }
}
