//
//  IconPickerView.swift
//  Habitime
//
//  Created by Furkan Sarı on 19.08.2023.
//

import SwiftUI

struct IconView: View {
    @State var iconName: String = "star.fill"
    @EnvironmentObject var selectedIcon: IconStore
    @State var iconColor: Color = .indigo
    @Binding var isSelectedIcon: Bool
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray.opacity(0.7))
                .frame(width: 48, height: 36)
                .cornerRadius(5)
            
            Button {
                print(iconName)
                selectedIcon.selectedIconName = iconName
                isSelectedIcon = false
            } label: {
                Image(systemName: iconName)
                    .font(.system(size: 22))
                    .foregroundColor(iconColor)
            }

        }
    }
}



