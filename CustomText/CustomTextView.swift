//
//  CustomTextView.swift
//  CustomText
//
//  Created by Lawrence Gimenez on 6/29/24.
//

import UIKit

class CustomTextView: UITextView {
    
    override func editMenu(for textRange: UITextRange, suggestedActions: [UIMenuElement]) -> UIMenu? {
        let highlightTextAction = UIAction(title: "Highlight Passage") { action in
            self.highlightText()
        }
        let addNotesAction = UIAction(title: "Add Notes") { action in
            
        }
        var actions = suggestedActions
        actions.insert(highlightTextAction, at: 0)
        actions.insert(addNotesAction, at: 1)
        return UIMenu(children: actions)
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(highlightText) {
            return true
        }
        return false
    }
    
    @objc func highlightText() {
        if let range = self.selectedTextRange, let selectedText = self.text(in: range) {
            print("Selected text is \(selectedText)")
            let highlight = Highlight(text: selectedText, location: selectedRange.location, length: selectedRange.length, uiColor: .purple)
            let highlightDict = [
                "data": highlight
            ]
            NotificationCenter.default.post(name: Notification.Name("highlightAdded"), object: nil, userInfo: highlightDict)
        }
    }
}
