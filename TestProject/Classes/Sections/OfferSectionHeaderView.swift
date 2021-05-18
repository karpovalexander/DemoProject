//
//  OfferSectionHeaderView.swift
//  TestProject


import UIKit

final class OfferSectionHeaderView: UIView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var separatorView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = Font.regular(size: 17.0)
        titleLabel.textColor = Color.gray
        
        separatorView.backgroundColor = Color.separator
    }
    
    func configure(viewModel: OfferSectionViewModel) {
        self.titleLabel.text = viewModel.title
    }
    
    static func loadFromNib() -> OfferSectionHeaderView {
        let view = Bundle(for: self).loadNibNamed(String(describing: self), owner: nil, options: nil)?.first
        return view as! OfferSectionHeaderView
    }
}
