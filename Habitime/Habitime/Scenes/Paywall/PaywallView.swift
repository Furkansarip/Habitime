//
//  PaywallView.swift
//  Habitime
//
//  Created by Furkan Sarı on 3.10.2023.
//

import SwiftUI

struct PaywallView: View {
    @State private var selectedButton = "Monthly"
    var category = ["Monthly", "Unlimited"]
    var body: some View {
        VStack(alignment: .center) {
            
            
            PaywallComponent(chooseValue: $selectedButton)
        }
    }
}

struct PaywallView_Previews: PreviewProvider {
    static var previews: some View {
        PaywallView()
    }
}
