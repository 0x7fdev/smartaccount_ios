//
//  ContentView.swift
//  SmartAccount
//
//  Created by Andrei C on 30.12.2023..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
            AccountantView()
            SettingsView()
        }
    }
}

#Preview {
    ContentView()
}
