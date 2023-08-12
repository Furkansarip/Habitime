//
//  CategoryButton.swift
//  Habitime
//
//  Created by Furkan Sarı on 12.08.2023.
//

import SwiftUI

struct CategoryButton: View {
    @State var buttonTitle: String
    var body: some View {
        Text(buttonTitle)
            .frame(width: 100, height: 50)
            .background(Color.gray.opacity(0.6))
            .cornerRadius(10)
            .foregroundColor(.white)
        
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButton(buttonTitle: "Title")
    }
}
