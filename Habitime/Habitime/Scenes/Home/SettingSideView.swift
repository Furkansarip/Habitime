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
                Section(header: Text("Uygulama")) {
                    NavigationLink(destination: Text("İtem 1 Ayrıntı Sayfası")) {
                        HStack {
                            Image(systemName: "gear")
                            Text("Genel")
                        }
                        
                    }
                    
                    NavigationLink(destination: Text("İtem 1 Ayrıntı Sayfası")) {
                        HStack {
                            Image(systemName: "paintpalette")
                            Text("Tema")
                        }
                    }
                    
                }
                    
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
                    
                    NavigationLink(destination: Text("İtem 1 Ayrıntı Sayfası")) {
                        HStack {
                            Image(systemName: "paperplane")
                            Text("Geri bildirim verin")
                        }
                    }
                }
                
                Section(header: Text("Abone Ol")) {
                    NavigationLink(destination: CategoryButton(buttonTitle: "Test", buttonColor: .constant(.red))) {
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
