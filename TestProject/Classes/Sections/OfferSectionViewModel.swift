//
//  OfferSectionViewModel.swift
//  TestProject


import Foundation

final class OfferSectionViewModel {
    let title: String?
    let items: [OfferTableViewCellViewModel]
    
    init(title: String, offers: [Offer]) {
        self.items = offers.map { offer -> OfferTableViewCellViewModel in
            return OfferTableViewCellViewModel(offer: offer)
        }
        self.title = title
    }
}
