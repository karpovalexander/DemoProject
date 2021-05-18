//
//  BannerCollectionViewCell.swift
//  TestProject


import UIKit
import IVCollectionKit
import Kingfisher

class BannerCollectionViewCell: UICollectionViewCell, ConfigurableCollectionItem {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descLabel: UILabel!
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var blurView: UIView!
    
    private lazy var blurEffect = UIBlurEffect(style: .light)
    private lazy var blurEffectView = UIVisualEffectView(effect: blurEffect)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.textColor = Color.black
        titleLabel.font = Font.bold(size: 16)
        
        descLabel.textColor = Color.black
        descLabel.font = Font.medium(size: 14)
        
        photoImageView.clipsToBounds = true
        photoImageView.contentMode = .scaleAspectFill
        
        blurView.backgroundColor = UIColor.clear
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.insertSubview(blurEffectView, at: 0)
        
        layer.cornerRadius = 16
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        blurEffectView.frame = blurView.bounds
    }
    
    
    // MARK: - ConfigurableCollectionItem
    
    func configure(item: BannerCollectionCellViewModel) {
        self.titleLabel.text = item.title
        self.descLabel.text = item.desc
        self.photoImageView.kf.setImage(with: item.imageUrl, placeholder: nil, options: [.transition(.fade(0.2))])
    }
    
    static func estimatedSize(item: BannerCollectionCellViewModel?, collectionViewSize: CGSize) -> CGSize {
        let width = collectionViewSize.width - 80
        let height = collectionViewSize.height - 40
        return CGSize(width: width, height: height)
    }
}
