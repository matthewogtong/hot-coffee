//
//  AddCoffeeOrderViewModel.swift
//  HotCoffee
//
//  Created by Matthew Ogtong on 1/26/22.
//

import Foundation

struct AddCoffeeOrderViewModel {
    
    var name: String?
    
    var types: [String] {
        return CoffeeName.allCases.map { $0.rawValue }
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map { $0.rawValue }
    }
    
}
