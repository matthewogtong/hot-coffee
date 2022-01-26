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
    
    @IBOutlet weak var coffeeSelectionTableView: UITableView!
    
    private var coffeeSizeSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.coffeeSelectionTableView.delegate = self
        self.coffeeSelectionTableView.dataSource = self
        
        setupUI()
        
    }
    
    private func setupUI() {
        
        self.coffeeSizeSegmentedControl = UISegmentedControl(items: self.vm.sizes)
        self.coffeeSizeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.coffeeSizeSegmentedControl)
        
        self.coffeeSizeSegmentedControl.topAnchor.constraint(equalTo: self.coffeeSelectionTableView.bottomAnchor, constant: 20).isActive = true
        
        self.coffeeSizeSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
}

//MARK: - UITableViewDelegate

extension AddOrderViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coffeeSelectionTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    
    
}

//MARK: - UITableViewDataSource

extension AddOrderViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = coffeeSelectionTableView.dequeueReusableCell(withIdentifier: K.reuseableCoffeeSelectionCell, for: indexPath)
        
        cell.textLabel?.text = vm.types[indexPath.row]
        
        return cell
    }
    
}
