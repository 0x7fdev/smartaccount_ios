//
//  MainView.swift
//  SmartAccount
//
//  Created by Andrei C on 31.12.2023..
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
            AccountantView()
            SettingsView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
