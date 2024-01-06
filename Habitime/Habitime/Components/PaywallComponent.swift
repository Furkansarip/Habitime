//
//  PaywallComponent.swift
//  Habitime
//
//  Created by Furkan Sarı on 3.10.2023.
//

import SwiftUI

struct PaywallComponent: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var chooseValue: String
    @State var paymentIndigo: Bool = true
    @State var paymentPink: Bool = false
    @State var paymentBlue: Bool = false
    var body: some View {
       /* ZStack {
            Rectangle()
                .background(
                    Rectangle()
                        .stroke(Color.pink, lineWidth: 20) // Border eklemek için .stroke kullanın
                )
                .cornerRadius(25)
                .foregroundColor(.clear)
            
                .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
            VStack {
                VStack(alignment: .center) {
                    Text("Habitime Premium")
                        .font(.largeTitle)
                        .foregroundColor(.pink)
                        .fontWeight(.semibold)
                    Text(chooseValue == "Monthly" ? "0.99/monthly" : "60/year")
                        .font(.title)
                }.padding(EdgeInsets(top: 14, leading: 16, bottom: 60, trailing: 16))
                
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Rectangle().frame(width: 40, height: 40)
                            .cornerRadius(5)
                            .foregroundColor(.red)
                            .overlay {
                                Image(systemName: "repeat")
                                    .bold()
                                    .font(.system(size: 23))
                                    .foregroundColor(.white)
                                
                            }
                        
                        Text("Add Unlimited Habit")
                        
                    }.padding(.bottom, 16)
                    
                    HStack(alignment: .center) {
                        Rectangle().frame(width: 40, height: 40)
                            .cornerRadius(5)
                            .foregroundColor(.blue)
                            .overlay {
                                Image(systemName: "cellularbars")
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundColor(.white)
                                
                            }
                        
                        Text("Track Your Habit")
                        
                    }.padding(.bottom, 16)
                    
                    HStack(alignment: .center) {
                        Rectangle().frame(width: 40, height: 40)
                            .cornerRadius(5)
                            .foregroundColor(.orange)
                            .overlay {
                                Image(systemName: "flame")
                                    .font(.system(size: 23))
                                    .bold()
                                    .foregroundColor(.white)
                                
                            }
                        
                        Text("Keep Motivated Yourself!")
                        
                    }
                    
                    
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 60, trailing: 16))
                Button("Get Premium") {
                    
                }.frame(width: 280, height: 50)
                    .background(.pink)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .font(.title)
            }
        } */
        VStack {
            Text("Habitime Premium")
                .font(.largeTitle)
                .foregroundColor(.indigo)
                .fontWeight(.semibold)
            /*Group {
                HStack {
                    Circle()
                        .foregroundColor(.indigo)
                        .frame(width: 13, height: 20)
                    Text("Unlimited Access")
                    
                }
                
                HStack {
                    Circle()
                        .foregroundColor(.indigo)
                        .frame(width: 13, height: 20)
                    Text("Track your progress")
                    
                }
                
                HStack {
                    Circle()
                        .foregroundColor(.indigo)
                        .frame(width: 13, height: 20)
                    Text("Focus on goals!")
                    
                }
            } */
            Spacer()
            VStack {
                    Image("premiumv2")
                                .resizable()
                                .frame(width: 300, height: 200)
                                .padding()
            }
           Spacer()
            
            ZStack {
                Rectangle()
                    .frame(width: 360, height: 80)
                    .background(
                        Rectangle()
                            .stroke(Color.pink, lineWidth: 15) // Border eklemek için .stroke kullanın
                    )
                    .cornerRadius(25)
                    .foregroundColor(.clear)
                    
                HStack {
                    ZStack {
                        Circle()
                            .stroke(Color.pink, lineWidth: 2) // Daireyi çizgiyle çevreleyin
                            .frame(width: 30, height: 30)
                            .onTapGesture {
                                paymentPink.toggle()
                                paymentIndigo = false
                                paymentBlue = false
                            }
                        Circle()
                            .foregroundColor(paymentPink ? .pink : .clear)
                            .frame(width: 20, height: 30)
                        
                    }
                    VStack(alignment: .leading) {
                        Text("$0.99 / Montly")
                        Text("Create unlimited habits")
                    }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 0))
                    
                        
                }
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 360, height: 80)
                    .background(
                        Rectangle()
                            .stroke(Color.indigo, lineWidth: 20) // Border eklemek için .stroke kullanın
                    )
                    .cornerRadius(25)
                    .foregroundColor(.clear)
                HStack {
                    ZStack {
                        Circle()
                            .stroke(Color.indigo, lineWidth: 2) // Daireyi çizgiyle çevreleyin
                            .frame(width: 30, height: 30)
                            .onTapGesture {
                                paymentIndigo.toggle()
                                paymentPink = false
                                paymentBlue = false
                            }
                        Circle()
                            .foregroundColor(paymentIndigo ? .indigo : .clear)
                            .frame(width: 20, height: 30)
                            
                        
                    }
                    VStack(alignment: .leading) {
                        Text("$9.99 / Yearly")
                        Text("Save 20%").foregroundColor(.red)
                    }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 66))
                    
                        
                }
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 360, height: 80)
                    .background(
                        Rectangle()
                            .stroke(Color.blue, lineWidth: 20) // Border eklemek için .stroke kullanın
                    )
                    .cornerRadius(25)
                    .foregroundColor(.clear)
                HStack {
                    ZStack {
                        Circle()
                            .stroke(Color.blue, lineWidth: 2) // Daireyi çizgiyle çevreleyin
                            .frame(width: 30, height: 30)
                            .onTapGesture {
                                paymentBlue.toggle()
                                paymentPink = false
                                paymentIndigo = false
                            }
                        Circle()
                            .foregroundColor(paymentBlue ? .blue : .clear)
                            .frame(width: 20, height: 30)
                        
                    }
                    VStack(alignment: .leading) {
                        Text("$19.99 / Unlimited")
                        Text("Best Offer 🤑")
                            .font(.subheadline)
                            .foregroundColor(.red)
                            
                    }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 36))
                    
                        
                }
                
                
                    
            }
            VStack {
                Button("Get Premium") {
                    
                }.frame(width: 350, height: 50)
                    .background(setColor())
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .font(.title)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 16, trailing: 16))
            }
            
                
            Spacer()
        }
        
        
        
        
    }
    
    func setColor() -> Color {
        if paymentPink {
            return .pink
        } else if paymentBlue {
            return .blue
        } else {
            return .indigo
        }
        
    }
}

struct PaywallComponent_Previews: PreviewProvider {
    static var previews: some View {
        PaywallComponent(chooseValue: .constant("Monthly"))
    }
}
