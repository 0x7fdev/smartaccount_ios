//
//  ContentView.swift
//  SmartAccount
//
//  Created by Andrei C on 30.12.2023..
//

import SwiftUI

struct ContentView: View {
    @State private var loggedIn = false

    var body: some View {
        Group {
            if loggedIn {
                MainView()
            } else {
                LoginView(onLoginSuccess: {
                    loggedIn = true
                })
            }
        }
        .onAppear(perform: checkCredentials)
    }
    
    func checkCredentials() {
        let (keyId, apiKey) = KeychainService.shared.load()
        if keyId != nil && apiKey != nil {
            self.loggedIn = true
        } else {
            self.loggedIn = false
        }
    }
}

#Preview {
    ContentView()
}
