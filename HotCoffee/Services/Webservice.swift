//
//  Webservice.swift
//  HotCoffee
//
//  Created by Matthew Ogtong on 1/22/22.
//

import Foundation

struct Resource<T: Codable> {
    let url: URL
}

class Webservice {
    
    func load<T>(resource: Resource, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
    }
    
}
