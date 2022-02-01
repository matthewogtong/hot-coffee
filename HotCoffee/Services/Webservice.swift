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

enum HttpMethod: String {
    
    case get = "GET"
    case post = "POST"
    
}

struct Resource<T: Codable> {

    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil

}

class Webservice {

    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {

        URLSession.shared.dataTask(with: resource.url) { data, response, error in

            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }

            let result = try? JSONDecoder().decode(T.self, from: data)

            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                completion(.failure(.decodingError))
            }

        }.resume()

    }

}
