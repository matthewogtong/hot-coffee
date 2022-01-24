//
//  OrderViewModel.swift
//  HotCoffee
//
//  Created by Matthew Ogtong on 1/24/22.
//

import Foundation

struct OrderViewModel {
    
    let order: Order
    
}

extension OrderViewModel {
    
    var name: String {
        return self.order.name
    }
    
    var coffeeName: String {
        return self.order.coffeeName.rawValue
    }
    
    var total: Float {
        return self.order.total
    }
    
    var size: String {
        return self.order.size.rawValue
    }
    
}
