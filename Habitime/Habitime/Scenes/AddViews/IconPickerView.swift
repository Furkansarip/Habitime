//
//  IconPickerView.swift
//  Habitime
//
//  Created by Furkan Sarı on 19.08.2023.
//

import SwiftUI

struct IconPickerView: View {
    @State var selectedIcon: Constant.IconSet
    @State var selectedColor: Color = .indigo
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
            iconSet = ["figure.walk", "figure.run", "bicycle.circle", "figure.strengthtraining.traditional", "figure.strengthtraining.functional", "figure.cooldown", "figure.martial.arts", "figure.mind.and.body", "figure.pilates", "basketball.fill", "water.waves", "volleyball.fill", "dumbbell.fill", "figure.yoga", "figure.hunting"]
        case .food:
            iconSet = ["leaf.fill", "fork.knife", "cup.and.saucer.fill", "cart.fill", "flame.fill", "wineglass.fill", "waterbottle.fill", "carrot.fill", "fish.fill", "waterbottle"]
        case .activity:
            iconSet = ["gamecontroller.fill", "arrowtriangle.right.circle.fill", "network", "camera.fill", "sailboat", "cursorarrow.motionlines", "map", "mappin.and.ellipse", "door.right.hand.closed", "party.popper.fill"]
        case .art:
            iconSet = ["music.note", "paintpalette.fill", "lightbulb.fill", "pencil.and.outline", "figure.martial.arts", "music.mic.circle", "scissors.circle", "wand.and.stars", "wallet.pass", "hammer.circle"]
        case .money:
            iconSet = ["dollarsign.circle", "creditcard", "banknote", "chart.bar", "laptopcomputer", "hourglass.bottomhalf.filled", "swiftdata", "movieclapper", "brain.filled.head.profile", "sunglasses"]
        case .other:
            iconSet = ["airplane", "car.fill", "network", "engine.combustion", "shield.lefthalf.filled", "checkmark.circle", "person.slash", "figure.pool.swim", "globe.europe.africa", "tornado"]
        }
    }
}


struct IconPickerView_Previews: PreviewProvider {
    static var previews: some View {
        IconPickerView(selectedIcon: .other, isPresented: .constant(true))
    }
}
