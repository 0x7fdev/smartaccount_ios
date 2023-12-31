//
//  UserService.swift
//  SmartAccount
//
//  Created by Andrei C on 31.12.2023..
//

import Foundation
import Combine

struct Company: Decodable {
    let companyName: String
    let address: String
    let vatId: String
    let statementEmail: String
    let invoiceEmail: String
}

struct User: Decodable {
    let firstName: String
    let lastName: String
    let email: String
    let phoneNumber: String?
    let company: Company
}

class UserService {
    static let shared = UserService()
    
    func fetchUser(completion: @escaping (Result<User, Error>) -> Void) {
        NetworkService.shared.getRequest(to: "/api/me") { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase

                    let user = try decoder.decode(User.self, from: data)
                    completion(.success(user))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
