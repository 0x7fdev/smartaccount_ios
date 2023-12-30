//
//  AccountantView.swift
//  SmartAccount
//
//  Created by Andrei C on 30.12.2023..
//

import SwiftUI

struct AccountantView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Vaš knjigovođa")
                .font(.system(size: 40, weight: .bold))
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
        .padding(.top, 20)
        .tabItem {
            Label("Knjigovođa", systemImage: "person.icloud")
        }
    }
}

struct AccountantView_Previews: PreviewProvider {
    static var previews: some View {
        AccountantView()
    }
}
