//
//  BannersTableViewCell.swift
//  TestProject


import IVCollectionKit
import TableKit

class BannersTableViewCell: UITableViewCell, ConfigurableCell {

    @IBOutlet private weak var collectionView: UICollectionView!
    private lazy var director = CollectionDirector(colletionView: collectionView)

    private let collectionViewLayout = PagedLayout()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    private func setupUI() {
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.layer.zPosition = 0
        collectionViewLayout.minimumLineSpacing = 16
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionViewLayout.itemWidth = frame.width - 80
    }
    
    // MARK: - ConfigurableCell
    
    func configure(with item: BannersTableCellViewModel) {
        let section = CollectionSection()
        section.insetForSection = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        section.lineSpacing = 16
        
        defer {
            director += section
            director.reload()
            layoutIfNeeded()
        }
        
        item.banners.forEach { (bannerViewModel) in
            section += CollectionItem<BannerCollectionViewCell>(item: bannerViewModel)
        }
        
        if !self.director.sections.isEmpty {
            self.director.removeSection(at: 0)
        }
    }
    
    static var defaultHeight: CGFloat? {
        return 210.0
    }
}
