//
//  PaywallView.swift
//  Habitime
//
//  Created by Furkan Sarı on 3.10.2023.
//

import SwiftUI

/*struct PaywallView: View {
    @State private var selectedButton = "Monthly"
    var category = ["Monthly", "Unlimited"]
    var body: some View {
        VStack(alignment: .center) {
            PaywallComponent(chooseValue: $selectedButton)
        }
    }
} */

import SwiftUI

struct PaywallView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            // Başlık
            Text("Upgrade to Premium")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("Unlock all features, remove habit limit, and enjoy a better experience!")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            // Özellik listesi
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text("Access to all premium content")
                }
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text("Limitless Habit")
                }
            }
            .padding(.horizontal)
            VStack(spacing: 15) {
                Button(action: {
                    // Aylık satın alma işlemi
                }) {
                    Text("Start Monthly Subscription - $4.99")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    // Yıllık satın alma işlemi
                }) {
                    Text("Start Annual Subscription - $49.99")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)

            // Kapatma butonu
            Button(action: {
                dismiss()
            }) {
                Text("Not now")
                    .font(.callout)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
    }
}


struct PaywallView_Previews: PreviewProvider {
    static var previews: some View {
        PaywallView()
    }
}
