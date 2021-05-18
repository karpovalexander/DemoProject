//
//  CategoryTableCellViewModel.swift
//  TestProject


import UIKit

final class CategoryTableCellViewModel {
    let items: [CategoryCollectionCellViewModel]
    
    let insetForSection = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    let lineSpacing: CGFloat = 20
    
    init(items: [CategoryCollectionCellViewModel]) {
        self.items = items
    }
}
