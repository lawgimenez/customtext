//
//  Highlight.swift
//  CustomText
//
//  Created by Lawrence Gimenez on 6/29/24.
//

import SwiftUI

struct Highlight {
    
    let text: String
    let location: Int
    let length: Int
    var uiColor: UIColor
    var color: Color {
        get {
            .init(uiColor: uiColor)
        }
        set {
            uiColor = .init(newValue)
        }
    }
}
