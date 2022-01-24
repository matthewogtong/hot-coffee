//
//  OrdersTableViewController.swift
//  HotCoffee
//
//  Created by Matthew Ogtong on 1/21/22.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    private func populateOrders() {
        
        guard let coffeeOrdersURL = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("URL is incorrect.")
        }
        
        let resource = Resource<[Order]>(url: coffeeOrdersURL)
        
        Webservice().load(resource: resource) { result in
            
            switch result {
                
            case .success(let orders):
                print(orders)
                
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    
}
