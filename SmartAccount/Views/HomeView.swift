//
//  HomeView.swift
//  SmartAccount
//
//  Created by Andrei C on 30.12.2023..
//

import SwiftUI

struct HomeView: View {
    @State private var user: User? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(self.user?.company.companyName ?? "")
                    .font(.system(size: 40, weight: .bold))
                Text("OIB: \(self.user?.company.vatId ?? "")")
            }
            .padding(.leading)
            ShortcutsStyleButtonsView()
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 20)
        .onAppear(perform: loadData)
        .tabItem {
            Label("Home", systemImage: "house")
        }
    }
    
    func loadData() {
        UserService.shared.fetchUser() { result in
            switch result {
            case .success(let user):
                print("User \(user.company.companyName)")
                self.user = user
            case .failure(let error):
                print("Error fetching user: \(error)")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
