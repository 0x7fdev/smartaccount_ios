//
//  HomeView.swift
//  SmartAccount
//
//  Created by Andrei C on 30.12.2023..
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("0x7f d.o.o.")
                    .font(.system(size: 40, weight: .bold))
                Text("OIB: 23618229102")
            }
            .padding(.leading)
            ShortcutsStyleButtonsView()
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 20)
        .tabItem {
            Label("Home", systemImage: "house")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
