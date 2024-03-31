//
//  Constants.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC02 on 2024-03-31.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

struct Constants {
    
    struct AppColor {
        static let Black = Color(hex: "1F1F1F")
        static let lightBlack = Color(hex: "464B5F")
        static let lightGrayColor = Color(hex: "F9F9F9")
        static let Red = Color(hex: "CB2D3E")
        static let lightRed = Color(hex: "EF473A")
        static let gradientRedHorizontal = LinearGradient(gradient: Gradient(colors: [Color(hex: "CB2D3E"), Color(hex: "EF473A")]), startPoint: .leading, endPoint: .trailing)
        static let gradientRedVertical = LinearGradient(gradient: Gradient(colors: [Color(hex: "CB2D3E"), Color(hex: "EF473A")]), startPoint: .bottom, endPoint: .top)
        static let shadowColor = Color(hex: "dddddd")
        static let lightGreen = Color(hex: "e8fbe8")
    }
    
    struct AppFont {
        static let extraBoldFont = "OpenSans-ExtraBold"
        static let boldFont = "OpenSans-Bold"
        static let semiBoldFont = "OpenSans-SemiBold"
        static let regularFont = "OpenSans-Regular"
        static let lightFont = "OpenSans-Light"
    }
}
