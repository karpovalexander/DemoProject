//
//  PaddedLabel.swift
//  TestProject


import UIKit

final class PaddedLabel: UILabel {

    var textInsets: UIEdgeInsets = .zero
    
    override func drawText(in rect: CGRect) {
        let insets = textInsets
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + textInsets.left + textInsets.right,
                      height: size.height + textInsets.top + textInsets.bottom)
    }
}

