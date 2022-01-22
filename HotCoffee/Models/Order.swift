//
//  Order.swift
//  HotCoffee
//
//  Created by Matthew Ogtong on 1/22/22.
//

import Foundation

struct Order: Codable {
    
    let name: String
    let coffeeName: String
    let total: Float
    let size: String
    
}
