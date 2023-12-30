//
//  SettingsView.swift
//  SmartAccount
//
//  Created by Andrei C on 30.12.2023..
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Postavke")
                .font(.system(size: 40, weight: .bold))
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
        .padding(.top, 20)
        .tabItem {
            Label("Postavke", systemImage: "gear")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
