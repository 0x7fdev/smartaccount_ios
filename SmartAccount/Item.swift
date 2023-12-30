//
//  Item.swift
//  SmartAccount
//
//  Created by Andrei C on 30.12.2023..
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
