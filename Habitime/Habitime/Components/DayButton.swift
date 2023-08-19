//
//  DayButton.swift
//  Habitime
//
//  Created by Furkan Sarı on 16.08.2023.
//

import SwiftUI

struct DayButton: View {
    @State var dayName: String
    
    var body: some View {
        Text(dayName)
            .font(.system(size: 20))
            .foregroundColor(.white)
            .frame(minWidth: 50, minHeight: 50)
            .cornerRadius(12)
    }
}

struct DayButton_Previews: PreviewProvider {
    static var previews: some View {
        DayButton(dayName: "Pzt")
    }
}
