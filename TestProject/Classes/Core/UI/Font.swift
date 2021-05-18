//
//  Font.swift
//  TestProject


import UIKit

extension UIFont {
    
    static func regular(size: CGFloat) -> UIFont {
        return FontFamily.SFUIText.regular.font(size: size)
    }
    
    static func bold(size: CGFloat) -> UIFont {
        return FontFamily.SFUIText.bold.font(size: size)
    }
    
    static func medium(size: CGFloat) -> UIFont {
        return FontFamily.SFUIText.medium.font(size: size)
    }
}
