import SwiftUI

struct GoalPickerView: View {
    @State private var selectedOption = 0
    @State private var selectedOption2 = 0
    let chooseTarget = ["Günlük", "Haftalık", "Aylık"]
    @State var monthly = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    @State var daily = ["1","2","3","4","5","6"]
    @State var weekly = ["1","2","3"]
    @State var targetText: String = "Günlük"
    @Binding var isSheetPresented: Bool
    @State private var selectionCount = 0
    @Binding var goalText: String
    var currentItems: [String] {
        if selectedOption == 0 {
            return daily
        }
        else if selectedOption == 1 {
            return weekly
        } else {
            return monthly
        }
        
    }
    var body: some View {
        VStack {
            HStack {
                Picker("", selection: $selectedOption) {
                    ForEach(chooseTarget.indices, id: \.self) { index in
                        Text("\(chooseTarget[index])").tag(index)
                        
                    }
                }
                .pickerStyle(.wheel)
                .frame(maxWidth: .infinity)
                
                .onChange(of: selectedOption) { newValue in
                    daily = monthly
                    updateUI()
                }
                
                Picker("", selection: $selectedOption2) {
                    ForEach(currentItems.indices, id: \.self) { index in
                        Text("\(currentItems[index]) \(targetText)").tag(index)
                    }
                }
                .pickerStyle(.wheel)
                .frame(maxWidth: .infinity)
            }
            
            Button("Kapat") {
                isSheetPresented = false
                goalText = "\(currentItems[selectedOption2]) \(targetText)"
            }
           
          
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
    func updateUI() {
        print(goalText)
        if selectedOption == 0 {
            targetText = "Günlük"
            selectedOption2 = 2
        }
        else if selectedOption == 1 {
            targetText = "Haftalık"
            selectedOption2 = 2
        } else {
            targetText = "Aylık"
            selectedOption2 = 2
        }
        
    }
}


struct CustomPickerView_Previews: PreviewProvider {
    static var previews: some View {
        GoalPickerView(isSheetPresented: .constant(false), goalText: .constant(""))
    }
}
