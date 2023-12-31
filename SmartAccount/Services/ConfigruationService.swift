//
//  ConfigruationService.swift
//  SmartAccount
//
//  Created by Andrei C on 31.12.2023..
//

import Foundation

struct Configuration {
    static var baseURL: String = {
        guard let baseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseUrl") as? String else {
            fatalError("Base URL not set in plist for this environment")
        }
        return baseURL
    }()
}
