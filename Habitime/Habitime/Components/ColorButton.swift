//
//  ColorButton.swift
//  Habitime
//
//  Created by Furkan Sarı on 10.08.2023.
//

import SwiftUI

struct ColorButton: View {
    @State var singleColor: Color = .red
    var body: some View {
        Button("") {}
            .frame(width: 0, height: 0)
            .foregroundColor(.white)
            .padding()
            .background(singleColor)
            .cornerRadius(8)
    }
}

struct ColorButton_Previews: PreviewProvider {
    static var previews: some View {
        ColorButton(singleColor: .green)
    }
}
