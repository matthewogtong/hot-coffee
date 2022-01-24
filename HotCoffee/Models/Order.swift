//
//  Order.swift
//  HotCoffee
//
//  Created by Matthew Ogtong on 1/22/22.
//

import Foundation

enum CoffeeName: String, Codable {
    
    case hotCoffee = "Hot Coffee"
    case cappuccino = "Cappuccino"
    case latte = "Latte"
    case espresso = "Espresso"
    case cortado = "Cortado"
    
}

enum CoffeeSize: String, Codable {
    
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
    
}

struct Order: Codable {
    
    let name: String
    let coffeeName: CoffeeName
    let total: Float
    let size: CoffeeSize
    
}
