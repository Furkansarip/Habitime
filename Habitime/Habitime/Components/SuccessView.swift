//
//  SuccessView.swift
//  Habitime
//
//  Created by Furkan Sarı on 3.10.2023.
//

import SwiftUI

struct SuccessView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 300, height: 350)
                .cornerRadius(25)
                .foregroundColor(self.colorScheme == .dark ? .pink : .white)
                .shadow(color: Color.gray, radius: 15, x: 0, y: 2)
                .overlay {
                    VStack(alignment: .center) {
                        Image(systemName: "plus")
                        
                        Text("Your habit has been created. Remember Continuity > Motivation")
                            .foregroundColor(self.colorScheme == .dark ? .white : .black)
                            
                    }
                    
                }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
