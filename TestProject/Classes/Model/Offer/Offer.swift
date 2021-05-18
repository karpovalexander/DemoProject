//
//  Offer.swift
//  TestProject


import Foundation

struct Offer: Codable {
    let id: String
    let name: String
    let desc: String?
    let groupName: String
    let type: OfferType
    let image: String?
    let price: Float?
    let discount: Float?
}
