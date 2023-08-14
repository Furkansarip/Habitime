import SwiftUI

struct CustomPickerView: View {
    @State private var selectedOption = 0
    @State private var selectedOption2 = 0
    let chooseTarget = ["Günlük", "Haftalık", "Aylık"]
    @State var monthly = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    @State var daily = ["1","2","3","4","5","6"]
    @State var weekly = ["1","2","3"]
    @State private var targetText = "Günlük"
    @State private var isPickerVisible = false
    @State private var selectionCount = 0
    var currentItems: [String] {
        if selectedOption == 0 {
            return daily
        }
        else if selectedOption == 1 {
            targetText = "Haftalık"
            return weekly
        } else {
            targetText = "Aylık"
            return monthly
        }
        
    }
    var body: some View {
        VStack {
            Button("Seçenekleri Göster") {
                isPickerVisible.toggle()
                
            }
            .padding(.bottom, 20)
            
            if isPickerVisible {
                HStack {
                    Picker("", selection: $selectedOption) {
                        ForEach(0..<chooseTarget.count) { index in
                            Text(chooseTarget[index])
                            
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .onChange(of: selectedOption) { newValue in
                        daily = monthly
                    }
                    
                    
                    Picker("", selection: $selectedOption2) {
                        ForEach(currentItems.indices, id: \.self) { index in
                            Text("\(currentItems[index]) \(targetText)").tag(index)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(maxWidth: .infinity)
                    .padding()
                    
                    
                }
              
                Button("Kapat") {
                    isPickerVisible.toggle()
                }
                .padding(.top, 20)
            }
        }
        //.edgesIgnoringSafeArea(.bottom)
    }
    func updateArray() {
        daily = monthly
    }
}


struct ContentVsiew_Previews: PreviewProvider {
    static var previews: some View {
        CustomPickerView()
    }
}
