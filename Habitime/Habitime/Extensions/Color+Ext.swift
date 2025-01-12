import SwiftUI

extension Color {
    init?(_ hex: String){
        var formattedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        formattedHex = formattedHex.replacingOccurrences(of: "#", with: "")

        var rgbValue: UInt64 = 0

        Scanner(string: formattedHex).scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
    
    func toHex() -> String? {
        if let color = UIColor(self).cgColor.components {
            let r = CGFloat(color[0])
            let g = CGFloat(color[1])
            let b = CGFloat(color[2])

            return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
        }
        return nil
    }
    
     func fromHex(_ hex: String) -> Color {
            var formattedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            formattedHex = formattedHex.replacingOccurrences(of: "#", with: "")

            var rgbValue: UInt64 = 0

            Scanner(string: formattedHex).scanHexInt64(&rgbValue)

            let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgbValue & 0x0000FF) / 255.0

            return Color(red: red, green: green, blue: blue)
        }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
