//
//  ButtonGrid.swift
//  SmartAccount
//
//  Created by Andrei C on 30.12.2023..
//

import SwiftUI

struct ColorfulButton: View {
    var iconName: String
    var label: String
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .foregroundColor(.blue)
            Text(label)
                .foregroundColor(.blue)
                .padding(.top, 0.5)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 120)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.blue, lineWidth: 1)
        )
    }
}

struct ShortcutsStyleButtonsView: View {
    var body: some View {
        let gridItems = [GridItem(.flexible()), GridItem(.flexible())] // Two columns
        let spacing: CGFloat = 16
        
        LazyVGrid(columns: gridItems, spacing: spacing) {
            Button(action: {}) {
                ColorfulButton(
                    iconName: "doc.fill",
                    label: "Novi izlazni račun"
                )
            }
            Button(action: {}) {
                ColorfulButton(
                    iconName: "archivebox.fill",
                    label: "Novi dokument"
                )
            }
            Button(action: {}) {
                ColorfulButton(
                    iconName: "lanyardcard.fill",
                    label: "Isplata plaća"
                )
            }
            Button(action: {}) {
                ColorfulButton(
                    iconName: "gym.bag.fill",
                    label: "Novi putni nalog"
                )
            }
        }
        .padding(spacing)
    }
}

struct ShortcutsStyleButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutsStyleButtonsView()
    }
}
