//
//  Color.swift
//  TestProject


import UIKit.UIColor

final class Color {
    static let background = UIColor(hex: 0xF7F8F8)
    static let white = UIColor(hex: 0xFFFFFF)
    static let searchBarField = UIColor(hex: 0xE9EAEB)
    static let black = UIColor(hex: 0x000000)
    static let gray = UIColor(hex: 0x7C7C7C)
    static let pink = UIColor(hex: 0xFD7576)
    static let lightBlue = UIColor(hex: 0xEDF3FC)
    static let separator = UIColor(hex: 0xEBEBEB)
    static let blue = UIColor.blue
}

//MARK:- Private
extension UIColor {
    
    convenience init(hex: Int, alpha: CGFloat = 1) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        
        self.init(red: components.R, green: components.G, blue: components.B, alpha: alpha)
    }
}
