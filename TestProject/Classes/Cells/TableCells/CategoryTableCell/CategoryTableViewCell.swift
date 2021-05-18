//
//  CategoryTableViewCell.swift
//  TestProject


import UIKit
import IVCollectionKit
import TableKit

class CategoryTableViewCell: UITableViewCell, ConfigurableCell {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    lazy var director = CollectionDirector(colletionView: collectionView)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupUI() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = false
        collectionView.collectionViewLayout = layout
    }
    
    // MARK: - ConfigurableCell
    
    func configure(with item: CategoryTableCellViewModel) {
        let section = CollectionSection()
        section.insetForSection = item.insetForSection
        section.lineSpacing = item.lineSpacing
        
        defer {
            director += section
            director.reload()
        }
        
        item.items.forEach { (viewModel) in
            let cell = CollectionItem<CategoryCollectionViewCell>(item: viewModel).onSelect{ _ in
                viewModel.isSelected.value = true
            }.onDeselect { _ in
                viewModel.isSelected.value = false
            }
            
            section += cell
        }
        
        if !self.director.sections.isEmpty {
            self.director.removeSection(at: 0)
        }
    }
    
    static var defaultHeight: CGFloat? {
        return 52.0
    }
    
}
