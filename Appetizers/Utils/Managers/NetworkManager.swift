//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Ernest Majewski on 20/12/2024.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    private let appetizerURL = baseURL + "/appetizers"
    
    private init() {}
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)

        
        do {
            return try JSONDecoder().decode(AppetizerResponse.self, from: data).request
        }
    }
}
