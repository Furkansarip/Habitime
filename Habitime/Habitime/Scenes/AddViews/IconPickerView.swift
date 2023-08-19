//
//  IconPickerView.swift
//  Habitime
//
//  Created by Furkan Sarı on 19.08.2023.
//

import SwiftUI

struct IconPickerView: View {
    @State var selectedIcon: Constant.IconSet = .food
    @State var iconSet = [String]()
    var body: some View {
        
        VStack {
            Text("Choose a Icon").font(.title)
            LazyVGrid(columns: [GridItem(.fixed(20)), GridItem(.fixed(80)), GridItem(.fixed(20)), GridItem(.fixed(80)), GridItem(.fixed(20))], spacing: 5) {
                ForEach(iconSet, id: \.self) { icon in
                    
                    IconView(iconName: icon, iconColor: .red)
                    
                }
            }
            
        }.onAppear {
            drawIconSet()
        }
    }
    
    @discardableResult func drawIconSet() -> [String] {
        print(selectedIcon)
        switch selectedIcon {
        case .sport:
            iconSet = ["figure.walk", "figure.outdoor.cycle", "figure.strengthtraining.traditional"]
            return iconSet
        case .food:
            iconSet = ["leaf.fill", "heart.fill", "star.fill", "bolt.fill", "cloud.fill", "moon.fill", "sun.min.fill", "bicycle", "figure.walk", "figure.outdoor.cycle", "figure.strengthtraining.traditional", "gamecontroller", "arrowtriangle.right.circle", "network", "camera"]
            return iconSet
        case .activity:
            iconSet = ["gamecontroller", "arrowtriangle.right.circle", "network", "camera"]
            return iconSet
        case .art:
            iconSet = ["music.quarternote.3", "house", "lightbulb", "paintpalette"]
            return iconSet
        case .money:
            iconSet = ["dollarsign", "clock", "hourglass", "bag"]
            return iconSet
        case .other:
            iconSet = ["pencil", "list.bullet", "airplane", "car"]
            return iconSet
        }
    }
}


struct IconPickerView_Previews: PreviewProvider {
    static var previews: some View {
        IconPickerView()
    }
}
