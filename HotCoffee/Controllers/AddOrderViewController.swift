//
//  AddOrderViewController.swift
//  HotCoffee
//
//  Created by Matthew Ogtong on 1/21/22.
//

import Foundation
import UIKit

protocol AddCoffeeOrderDelegate {
    
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController)
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController)
    
}

class AddOrderViewController: UIViewController {
    
    private var vm = AddCoffeeOrderViewModel()
    
    var delegate: AddCoffeeOrderDelegate?
    
    @IBOutlet weak var coffeeSelectionTableView: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
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
    
    @IBAction func close(_ sender: UIBarButtonItem) {
    
        if let delegate = self.delegate {
            delegate.addCoffeeOrderViewControllerDidClose(controller: self)
        }
        
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        let name = self.nameTextField.text
        
        let selectedSize = self.coffeeSizeSegmentedControl.titleForSegment(at: self.coffeeSizeSegmentedControl.selectedSegmentIndex)
        
        guard let indexPath = self.coffeeSelectionTableView.indexPathForSelectedRow else {
            fatalError("Error in selecting coffee!")
        }
        
        self.vm.name = name
        self.vm.selectedSize = selectedSize
        self.vm.selectedType = self.vm.types[indexPath.row]
        
        Webservice().load(resource: Order.create(vm: self.vm)) { result in
            
            switch result {
            case .success(let order):
                
                if let order = order, let delegate = self.delegate {
                    DispatchQueue.main.async {
                        delegate.addCoffeeOrderViewControllerDidSave(order: order, controller: self)
                    }
                }
                
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
}

//MARK: - UITableViewDelegate

extension AddOrderViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coffeeSelectionTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        coffeeSelectionTableView.cellForRow(at: indexPath)?.accessoryType = .none
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
