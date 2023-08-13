import SwiftUI

struct TestView: View {
    @State private var selectedButton: Int? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                selectedButton = 1
            }) {
                Text("Buton 1")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: selectedButton == 1 ? 5 : 0)
                    )
            }
            
            Button(action: {
                selectedButton = 2
            }) {
                Text("Buton 2")
                    .padding()
                    .background(selectedButton == 2 ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: selectedButton == 2 ? 2 : 0)
                    )
            }
        }
        .padding()
    }
}

struct ContetView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
