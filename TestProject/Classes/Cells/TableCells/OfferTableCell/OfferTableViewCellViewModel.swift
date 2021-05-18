//
//  OfferTableViewCellViewModel.swift
//  TestProject


import Foundation

final class OfferTableViewCellViewModel {
    let title: String
    let desc: String?
    let discount: String?
    let oldPrice: NSAttributedString?
    let newPrice: String?
    let photoUrl: URL?
    
    init(offer: Offer) {
        self.title = offer.name
        self.desc = offer.desc
        
        if let discount = offer.discount {
            self.discount = "-\(Int(discount * 100))%"
        } else {
            self.discount = nil
        }
        
        if let price = offer.price {
            self.newPrice =  NumberFormatter.formattedCurrency(value: price - (price * (offer.discount ?? 0)))
        } else {
            self.newPrice = nil
        }
        
        let attributes: [NSAttributedString.Key : Any] = [.font: Font.medium(size: 13),
                                                          .foregroundColor: Color.gray,
                                                          .strikethroughStyle: 2]
        self.oldPrice = NSAttributedString(string: NumberFormatter.formattedCurrency(value: offer.price) ?? "", attributes: attributes)
        
        
        if let image = offer.image {
            self.photoUrl = URL(string: image)
        } else {
            self.photoUrl = nil
        }
    }
}
