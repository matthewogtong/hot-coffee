//
//  Order.swift
//  HotCoffee
//
//  Created by Matthew Ogtong on 1/22/22.
//

import Foundation

enum CoffeeSize: String, Codable {
    
    case small
    case medium
    case large
    
}

struct Order: Codable {
    
    let name: String
    let coffeeName: String
    let total: Float
    let size: CoffeeSize
    
}
