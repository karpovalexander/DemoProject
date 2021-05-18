//
//  OfferTableViewCell.swift
//  TestProject


import TableKit
import Kingfisher

class OfferTableViewCell: UITableViewCell, ConfigurableCell {

    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descLabel: UILabel!
    @IBOutlet private weak var basketIconImageView: UIImageView!
    @IBOutlet private weak var discountLabel: PaddedLabel!
    @IBOutlet private weak var oldPriceLabel: UILabel!
    @IBOutlet private weak var newPriceLabel: UILabel!
    @IBOutlet private weak var separatorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        basketIconImageView.roundCorners(radius: basketIconImageView.frame.height / 2.0)
        discountLabel.roundCorners(radius: discountLabel.frame.height / 2.0)
    }
    
    // MARK: - ConfigurableCell
    
    func configure(with item: OfferTableViewCellViewModel) {
        self.titleLabel.text = item.title
        self.descLabel.text = item.desc
        self.photoImageView.kf.setImage(with: item.photoUrl, placeholder: nil, options: [.transition(.fade(0.2))])
        self.discountLabel.text = item.discount
        self.discountLabel.isHidden = item.discount == nil
        self.newPriceLabel.text = item.newPrice
        self.oldPriceLabel.attributedText = item.oldPrice
    }
    
    static var defaultHeight: CGFloat? {
        return 108.0
    }
}

extension OfferTableViewCell {
    
    // MARK: - UI
    
    private func setupUI() {
        photoImageView.clipsToBounds = true
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.roundCorners(radius: 4.0)
        
        titleLabel.textColor = Color.black
        titleLabel.font = Font.bold(size: 17.0)
        
        descLabel.textColor = Color.gray
        descLabel.font = Font.regular(size: 14.0)
        
        basketIconImageView.backgroundColor = Color.lightBlue
        basketIconImageView.image = Asset.busket.image
        
        discountLabel.textColor = Color.white
        discountLabel.backgroundColor = Color.pink
        discountLabel.font = Font.medium(size: 14)
        discountLabel.textInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
        
        newPriceLabel.textColor = Color.pink
        newPriceLabel.font = Font.medium(size: 15)
        
        separatorView.backgroundColor = Color.separator
    }
}
