//
//  Order.swift
//  HotCoffee
//
//  Created by Matthew Ogtong on 1/22/22.
//

import Foundation

enum CoffeeName: String, Codable, CaseIterable {
    
    case hotCoffee = "Hot Coffee"
    case cappuccino = "Cappuccino"
    case latte = "Latte"
    case espresso = "Espresso"
    case cortado = "Cortado"
    case chaiLatter = "Chai Latte"
    
}

enum CoffeeSize: String, Codable, CaseIterable {
    
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
    
}

struct Order: Codable {
    
    let name: String
    let coffeeName: CoffeeName
//    let total: Float
    let size: CoffeeSize
    
}

extension Order {
    
    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order?> {
        
        let order = Order(vm)
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("URL is incorrect!")
        }

        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order!")
        }
        
        let resource = Resource<Order?>(url: url)
        
        return resource
                
    }
    
}

extension Order {
    
    init?(_ vm: AddCoffeeOrderViewModel) {
        
        guard let name = vm.name,
              let selectedType = CoffeeName(rawValue: vm.selectedType!),
              let selectedSize = CoffeeSize(rawValue: vm.selectedSize!)
        else {
            return nil
        }
        
        self.name = name
        self.coffeeName = selectedType
        self.size = selectedSize
        
    }
    
}
