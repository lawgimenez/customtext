//
//  Item.swift
//  CustomText
//
//  Created by Lawrence Gimenez on 6/29/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
