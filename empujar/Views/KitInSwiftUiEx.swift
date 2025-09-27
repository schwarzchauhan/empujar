//
//  KitInSwiftUiEx.swift
//  empujar
//
//  Created by Harsh Chauhan on 9/26/25.
//

import SwiftUI
import Combine

class ContentVM: ObservableObject {
    @Published var timer: Int = 0
    var messages = ["Harsh Chauhan gotta be a long text so it takes up multiple lines", "Harsh", "Chauhan", "Is", "Great"]
    
    init() {
        createDefaultTimer()
    }
    
    func createDefaultTimer() {
        let timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(defaultTimerTick),
                                         userInfo: nil,
                                         repeats: true)
        RunLoop.current.add(timer, forMode: .default)
    }
    
    @objc func defaultTimerTick() {
        timer += 1
    }
    
}

struct KitInSwiftUiEx: View {
    @State private var text: String = ""
    @State private var placeHolder: String = "type here..."
    @ObservedObject var vm = ContentVM()
    
    var body: some View {
        VStack(spacing: 0) {
            
            Text(String(vm.timer))
            
            Text(text)
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack(spacing: 0) {
                Text("SwiftUI: - ")
                    .font(.headline)
                    .fontWeight(.bold)
                TextField(placeHolder, text:$text)
            }
            
            HStack(spacing: 0) {
                Text("UIKit: - ")
                    .font(.headline)
                    .fontWeight(.bold)
                UITextFieldViewRepresentable(text: $text, placeholder: placeHolder, placeholderColor: UIColor.red.withAlphaComponent(0.5))
            }
            
            // MARK: ViewThatFits example
            ViewThatFitsEx
            
        }
    }
    
    var ViewThatFitsEx: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(vm.messages, id: \.self) { msg in
                HStack {
                    Image(systemName: "pencil.line")
                    ViewThatFits {
                        Text(msg)
                            .fixedSize(horizontal: false, vertical: true)
                        HStack {
                            Text(msg)
                                .lineLimit(2)
                            Button("more") {
                                // action
                            }
                        }
                    }
                    
                }
            }
        }
    }
    
    struct UITextFieldViewRepresentable: UIViewRepresentable {
        @Binding var text: String
        var placeholder: String
        var placholderColor: UIColor
        
        init(text: Binding<String>, placeholder: String, placeholderColor: UIColor) {
            self._text = text
            self.placeholder = placeholder
            self.placholderColor = placeholderColor
        }
        
        func makeUIView(context: Context) -> UITextField {
            let editTextField = getTextField()
            editTextField.delegate = context.coordinator
            return editTextField
        }
        
        // swiftui to uikit
        func updateUIView(_ uiView: UITextField, context: Context) {
            uiView.text = text
        }
        
        func makeCoordinator() -> Coordinator {
            return Coordinator(text: $text)
        }
        
        func getTextField() -> UITextField {
            let textField = UITextField(frame: .zero)
            let placeholder = NSAttributedString(string: placeholder,
                                                 attributes: [NSAttributedString.Key.foregroundColor: placholderColor])
            textField.attributedPlaceholder = placeholder
            return textField
        }
        
        class Coordinator: NSObject, UITextFieldDelegate {
            @Binding var text: String
            
            init(text: Binding<String>) {
                self._text = text
            }
            
            func textFieldDidEndEditing(_ textField: UITextField) {
                text = textField.text ?? ""
            }
        }
    }
}
