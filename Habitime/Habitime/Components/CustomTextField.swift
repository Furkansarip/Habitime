//
//  CustomTextField.swift
//  Habitime
//
//  Created by Furkan Sarı on 14.08.2023.
//

import UIKit
import SwiftUI

struct CustomTextField: UIViewRepresentable {
    @Binding var text: String
    var isFirstResponder: Bool

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.placeholder = "Hedef"
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        if isFirstResponder {
            uiView.becomeFirstResponder()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextField

        init(_ parent: CustomTextField) {
            self.parent = parent
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            //parent.text = textField.text ?? ""
        }
    }
}
