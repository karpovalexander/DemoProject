//
//  CategoryCollectionViewCell.swift
//  TestProject


import UIKit
import IVCollectionKit

class CategoryCollectionViewCell: UICollectionViewCell, ConfigurableCollectionItem {

    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.backgroundColor = Color.white
        titleLabel.textColor = Color.gray
        titleLabel.font = Font.regular(size: 15.0)
        titleLabel.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.layer.cornerRadius = titleLabel.frame.height / 2.0
    }

    // MARK: - ConfigurableCollectionItem
    
    func configure(item: CategoryCollectionCellViewModel) {
        self.titleLabel.text = item.title
        self.setupWithState(isSelected: item.isSelected.value)
        item.isSelected.signal.observeValues { (isSelected) in
            self.setupWithState(isSelected: isSelected)
        }
    }
    
    private func setupWithState(isSelected: Bool) {
        // need handle
        
        layoutIfNeeded()
    }
    
    static func estimatedSize(item: CategoryCollectionCellViewModel?, collectionViewSize: CGSize) -> CGSize {
        let width = (collectionViewSize.width - 40 - 32) / 3
        let height = collectionViewSize.height
        return CGSize(width: width, height: height)
    }
}
