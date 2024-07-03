
import UIKit
    
extension UIColor {

    static let whiteColor = UIColor(hex: "#FFFFFF")
    static let tupColor = UIColor(hex: "#4659FF")
    static let backgroundColor = UIColor(hex: "#01010E")
    static let borderColor = UIColor(hex: "#C3C3FF")
    static let darkColor = UIColor(hex: "#171320")
    static let textColor = UIColor(hex: "#D7DEE8")
    
    // init for HEX
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        let alpha = CGFloat(1.0)
    
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
