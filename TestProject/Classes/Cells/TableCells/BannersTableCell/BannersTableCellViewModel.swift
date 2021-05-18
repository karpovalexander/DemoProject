//
//  BannersTableCellViewModel.swift
//  TestProject


import Foundation

final class BannersTableCellViewModel {
    let banners: [BannerCollectionCellViewModel]
    
    init(banners: [Banner]) {
        self.banners = banners.map { banner -> BannerCollectionCellViewModel in
            return BannerCollectionCellViewModel(banner: banner)
        }
    }
}
