//
//  SettingSideView.swift
//  Habitime
//
//  Created by Furkan Sarı on 26.08.2023.
//

import SwiftUI

struct SettingSideView: View {
    var body: some View {
        NavigationView {
            List {
              
                    
                Section(header: Text("Genel")) {
                    NavigationLink(destination: Text("İtem 1 Ayrıntı Sayfası")) {
                        HStack {
                            Image(systemName: "network")
                            Text("Twitter")
                        }
                    }
                    
                    NavigationLink(destination: Text("İtem 1 Ayrıntı Sayfası")) {
                        HStack {
                            Image(systemName: "star")
                            Text("Uygulamayı puanla")
                        }
                    }
                    
                    
                    
                }
                
                Section(header: Text("Abone Ol")) {
                    NavigationLink(destination: PaywallView()) {
                       SubscribeView()
                    }
                }
                    
                }
                
                .listStyle(.insetGrouped)
                .navigationBarTitle("Ayarlar")
                .background(Color.green)
                
                
        }
      
            
    }
        
    }
    
    struct SettingSideView_Previews: PreviewProvider {
        static var previews: some View {
            SettingSideView()
        }
    }
