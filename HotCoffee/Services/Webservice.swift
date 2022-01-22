//
//  Webservice.swift
//  HotCoffee
//
//  Created by Matthew Ogtong on 1/22/22.
//

import Foundation

enum NetworkError: Error {

    case decodingError
    case domainError
    case urlError
    
}

struct Resource<T: Codable> {
    
    let url: URL
    
}

class Webservice {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
    }
    
}
