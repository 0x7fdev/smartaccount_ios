//
//  LoginView.swift
//  SmartAccount
//
//  Created by Andrei C on 31.12.2023..
//

import SwiftUI

struct LoginView: View {
    var onLoginSuccess: () -> Void
    @State private var keyId: String = ""
    @State private var apiKey: String = ""
    
    var body: some View {
        VStack{
            Image(.logo)
                .resizable()
                .scaledToFit()
                .padding(20)

            Text("Za korištenje ove aplikacije potrebno je generirati API ključeve putem web aplikacije te ih ručno upisati u slijedeća polja:")
                .padding(.horizontal, 40)
                .multilineTextAlignment(.center)
            
            VStack {
                TextField("ID Ključa", text: $keyId)
                    .padding()
                    .border(Color.gray)
                
                SecureField("API Ključ", text: $apiKey)
                    .padding()
                    .border(Color.gray)
                
                Button("Prijava", action: {
                    login(keyId: keyId, apiKey: apiKey)
                })
                    .padding(.top, 20)
            }
            .padding(20)
            
        }
        .frame(maxWidth: .infinity, alignment: .center)
        
    }
    
    func login(keyId: String, apiKey: String) {
        let status = KeychainService.shared.save(keyId: keyId, apiKey: apiKey)
        if status {
            onLoginSuccess()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(onLoginSuccess: {})
    }
}
