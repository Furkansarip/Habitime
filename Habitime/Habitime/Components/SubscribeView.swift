//
//  SubscribeView.swift
//  Habitime
//
//  Created by Furkan Sarı on 26.08.2023.
//

import SwiftUI

struct SubscribeView: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle().frame(width: 55, height: 50)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .overlay {
                        Image("Hlogo")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 50, height: 45)
                            
                        
                    }
                VStack {
                    Text("Upgrade Habitime Pro")
                    Text("Unlimited access and development time in Pro mode").font(.system(size: 14))
                }
            }
            }
        }
    }
    
    struct SubscribeView_Previews: PreviewProvider {
        static var previews: some View {
            SubscribeView()
        }
    }
