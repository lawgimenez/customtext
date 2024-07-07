//
//  TextSelectable.swift
//  CustomText
//
//  Created by Lawrence Gimenez on 6/29/24.
//

import SwiftUI

struct TextSelectable: UIViewRepresentable {
    
    var text: NSAttributedString
    
    init(text: NSAttributedString) {
        self.text = text
    }
    
    func makeUIView(context: Context) -> CustomTextView {
        let customTextView = CustomTextView()
        customTextView.delegate = context.coordinator
        return customTextView
    }
    
    func updateUIView(_ uiView: CustomTextView, context: Context) {
        uiView.attributedText = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        var text: NSAttributedString
        
        init(_ text: NSAttributedString) {
            self.text = text
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.text = textView.attributedText
        }
    }
}
