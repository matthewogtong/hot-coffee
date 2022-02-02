//
//  OrdersTableViewController.swift
//  HotCoffee
//
//  Created by Matthew Ogtong on 1/21/22.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    
    let orderListViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    private func populateOrders() {
        
        Webservice().load(resource: Order.all) { [weak self] result in
            
            switch result {
                
            case .success(let orders):
                self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.reuseableOrderCell, for: indexPath)
        
        cell.textLabel?.text = vm.coffeeName
        
        cell.detailTextLabel?.text = vm.size
        
        return cell
        
    }
    
}

extension OrdersTableViewController: AddCoffeeOrderDelegate {
    
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController) {
        <#code#>
    }
    
}
