//
//  KeychainService.swift
//  SmartAccount
//
//  Created by Andrei C on 31.12.2023..
//

import Security
import Foundation

class KeychainService {
    static let shared = KeychainService()

    private init() { }

    func storeKey(_ key: String, data: Data) -> OSStatus {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        
        // Delete any existing item before adding to prevent duplicates
        SecItemDelete(query as CFDictionary)
        
        // Add new item to keychain
        return SecItemAdd(query as CFDictionary, nil)
    }

    func retrieveKey(_ key: String) -> Data? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        if status == noErr, let data = item as? Data {
            return data
        }
        
        return nil
    }

    func save(keyId: String, apiKey: String) -> Bool {
        let keyIdData = Data(keyId.utf8)
        let apiKeyData = Data(apiKey.utf8)
        
        let keyIdStatus = storeKey("keyId", data: keyIdData)
        let apiKeyStatus = storeKey("apiKey", data: apiKeyData)
        
        return keyIdStatus == noErr && apiKeyStatus == noErr
    }
    
    func load() -> (keyId: String?, apiKey: String?) {
        if let keyIdData = retrieveKey("keyId"), let keyId = String(data: keyIdData, encoding: .utf8),
           let apiKeyData = retrieveKey("apiKey"), let apiKey = String(data: apiKeyData, encoding: .utf8) {
            return (keyId, apiKey)
        }
        
        return (nil, nil)
    }
    
    func loggedIn() -> Bool {
        let (keyId, _) = load()
        
        return keyId == nil
    }
    
    func logout() {
        let idQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "keyId",
        ]
        SecItemDelete(idQuery as CFDictionary)
        
        let keyQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "apiKey",
        ]
        SecItemDelete(keyQuery as CFDictionary)
    }
}
