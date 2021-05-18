//
//  CategoryCollectionCellViewModel.swift
//  TestProject


import UIKit
import ReactiveSwift

final class CategoryCollectionCellViewModel {
    let title: String
    let isSelected = MutableProperty(false)
    
    init(title: String) {
        self.title = title
    }
}
