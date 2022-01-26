//
//  AddOrderViewController.swift
//  HotCoffee
//
//  Created by Matthew Ogtong on 1/21/22.
//

import Foundation
import UIKit

class AddOrderViewController: UIViewController {
    
    private var vm = AddCoffeeOrderViewModel()
    
    @IBOutlet weak var coffeSelectionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.coffeSelectionTableView.delegate = self
        self.coffeSelectionTableView.dataSource = self
        
    }
    
}

//MARK: - UITableViewDelegate

extension AddOrderViewController: UITableViewDelegate {
    
    
    
}

//MARK: - UITableViewDataSource

extension AddOrderViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = coffeSelectionTableView.dequeueReusableCell(withIdentifier: K.reuseableCoffeeSelectionCell, for: indexPath)
        
        cell.textLabel?.text = vm.types[indexPath.row]
        
        return cell
    }
    
}
