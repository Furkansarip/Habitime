//
//  IconPickerView.swift
//  Habitime
//
//  Created by Furkan Sarı on 19.08.2023.
//

import SwiftUI

struct IconView: View {
    @State var iconName: String = "star.fill"
    @State var iconColor: Color = .indigo
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray.opacity(0.7))
                .frame(width: 48, height: 36)
                .cornerRadius(5)
            
            Button {
                print(iconName)
            } label: {
                Image(systemName: iconName)
                    .font(.system(size: 22))
                    .foregroundColor(iconColor)
            }

        }
    }
}


struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView()
    }
}
