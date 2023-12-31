//
//  NetworkService.swift
//  SmartAccount
//
//  Created by Andrei C on 31.12.2023..
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    func getRequest(to resourcePath: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let urlString = Configuration.baseURL + resourcePath
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (keyId, apiKey) = KeychainService.shared.load()
        let headers = [
            "authorization": apiKey,
            "key-id": keyId,
            "accept": "application/json"
        ]
        
        headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.serverError))
                return
            }
            
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NetworkError.noData))
            }
        }
        
        task.resume()
    }
    
    enum NetworkError: Error {
        case invalidURL
        case serverError
        case noData
        case jsonConversionFailure
    }
}
