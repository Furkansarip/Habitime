//
//  IconPickerView.swift
//  Habitime
//
//  Created by Furkan Sarı on 19.08.2023.
//

import SwiftUI

struct IconPickerView: View {
    @State var selectedIcon: Constant.IconSet
    @State var selectedColor: Color = .red
    @State var iconSet = [String]()
    @Binding var isPresented: Bool
    var body: some View {
        
        VStack {
            Text("Choose a Icon").font(.title)
            LazyVGrid(columns: [GridItem(.fixed(20)), GridItem(.fixed(80)), GridItem(.fixed(20)), GridItem(.fixed(80)), GridItem(.fixed(20))], spacing: 5) {
                ForEach(iconSet, id: \.self) { icon in
                    IconView(iconName: icon, iconColor: selectedColor, isSelectedIcon: $isPresented)
                }
            }
            
        }.onAppear {
            drawIconSet()
        }
    }
    
    func drawIconSet() {
        switch selectedIcon {
        case .sport:
            iconSet = ["figure.walk", "figure.outdoor.cycle", "figure.strengthtraining.traditional"]
        case .food:
            iconSet = ["leaf.fill", "heart.fill", "star.fill", "bolt.fill", "cloud.fill", "moon.fill", "sun.min.fill", "bicycle", "figure.walk", "figure.outdoor.cycle", "figure.strengthtraining.traditional", "gamecontroller", "arrowtriangle.right.circle", "network", "camera"]
        case .activity:
            iconSet = ["gamecontroller", "arrowtriangle.right.circle", "network", "camera"]
        case .art:
            iconSet = ["music.quarternote.3", "house", "lightbulb", "paintpalette"]
        case .money:
            iconSet = ["dollarsign", "clock", "hourglass", "bag"]
        case .other:
            iconSet = ["pencil", "list.bullet", "airplane", "car"]
            
        }
    }
}


struct IconPickerView_Previews: PreviewProvider {
    static var previews: some View {
        IconPickerView(selectedIcon: .food, isPresented: .constant(true))
    }
}
