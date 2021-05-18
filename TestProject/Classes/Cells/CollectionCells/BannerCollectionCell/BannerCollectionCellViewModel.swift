//
//  BannerCollectionCellViewModel.swift
//  TestProject


import Foundation

final class BannerCollectionCellViewModel {
    let title: String?
    let desc: String?
    let imageUrl: URL?
    
    init(banner: Banner) {
        self.title = banner.title
        self.desc = banner.desc
        self.imageUrl = URL(string: banner.image ?? "")
    }
}
