//
//  ContentView.swift
//  CustomTextField
//
//  Created by Huynh Tan Phu on 4/14/20.
//  Copyright © 2020 Filesoft. All rights reserved.
//

import SwiftUI

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}

struct CustomTextField: UIViewRepresentable {
    @Binding var text: String
    @Binding var isFirstResponder: Bool
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.addTarget(
            context.coordinator,
            action: #selector(Coordinator.oneEditingChanged(_:)) ,
            for: .editingChanged)
        return textField
    }
    
    func updateUIView(_ textField: UITextField, context: Context) {
        textField.text = self.text
        if self.isFirstResponder {
            textField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }
    
    class Coordinator {
        var customTextField: CustomTextField
        
        init(_ customTextField: CustomTextField) {
            self.customTextField = customTextField
        }
        
        @objc func oneEditingChanged(_ sender: UITextField) {
            self.customTextField.text = sender.text ?? ""
        }
    }
}
