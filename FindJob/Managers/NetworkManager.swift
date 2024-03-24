//
//  NetworkManager.swift
//  FindJob
//
//  Created by Denis on 3/20/24.
//

import Foundation

enum URLs: String {
    case api = "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14"
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    func fetchData<T: Decodable>(from url: String) async throws -> T {
        guard let url = URL(string: url) else  {
            throw URLError(.badURL)
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        let result = try JSONDecoder().decode(T.self, from: data)
                
        return result
    }
}
