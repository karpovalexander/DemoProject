//
//  UIView+Extension.swift
//  TestProject


import UIKit

extension UIView {
    func roundCorners(radius: CGFloat, corners: UIRectCorner = .allCorners, borderWidth: CGFloat = 0, borderColor: UIColor? = nil) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        
        borderColor?.setStroke()
        path.lineWidth = borderWidth
        path.stroke()
    }
}
