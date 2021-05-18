//
//  PagedLayout.swift
//  TestProject


import UIKit
import ReactiveSwift

final class PagedLayout : UICollectionViewFlowLayout {
    
    private var nextPageOffset: CGFloat = 0
    private var lastOffset: CGFloat = 0

    var currentPage: Int = 0 {
        didSet { currentPageProperty.value = currentPage }
    }
    
    var itemWidth: CGFloat = UIScreen.main.bounds.width
    
    let currentPageProperty = MutableProperty(0)
    
    override init() {
        super.init()
        scrollDirection = .horizontal
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = self.collectionView, collectionView.numberOfItems(inSection: 0) > 0 else { return .zero }
        
        let lineSpacing: CGFloat = 16
        let pageSize = lineSpacing + itemWidth
        
        if abs(proposedContentOffset.x - nextPageOffset) < 5 {
            collectionView.selectItem(at: IndexPath(item: currentPage, section: 0), animated: true, scrollPosition: .centeredHorizontally)
            lastOffset = proposedContentOffset.x
            return proposedContentOffset
        }
        
        guard velocity.x != 0 else {
            var xOffset: CGFloat = 0
            
            if proposedContentOffset.x >= lastOffset {
                let oldDiff = abs(proposedContentOffset.x - nextPageOffset)
                let nextPageDiff = abs(proposedContentOffset.x - (nextPageOffset + pageSize))
                if oldDiff < nextPageDiff {
                    xOffset = nextPageOffset
                } else {
                    xOffset = nextPageOffset + pageSize
                    currentPage += 1
                }
            } else {
                let oldDiff = abs(proposedContentOffset.x - nextPageOffset)
                let nextPageDiff = abs(proposedContentOffset.x - (nextPageOffset - pageSize))
                if oldDiff > nextPageDiff {
                    xOffset = nextPageOffset - pageSize
                    currentPage -= 1
                } else {
                    xOffset = nextPageOffset
                }
            }
            
            lastOffset = proposedContentOffset.x
            nextPageOffset = xOffset
            return  CGPoint(x: nextPageOffset, y: 0)
        }
        
        
        let directionMultuplier: CGFloat = velocity.x > 0 ? 1 : -1
        
        let offsetCandidate = pageSize * directionMultuplier
        
        if offsetCandidate + nextPageOffset < 0 {
            currentPage = 0
            nextPageOffset = 0
        } else if offsetCandidate + nextPageOffset >= collectionViewContentSize.width - pageSize {
            nextPageOffset = itemWidth
            currentPage = collectionView.numberOfItems(inSection: 0) - 1
        } else {
            currentPage += Int(directionMultuplier)
            nextPageOffset = CGFloat(currentPage) * pageSize
        }
        
        lastOffset = proposedContentOffset.x
        
        return CGPoint(x: nextPageOffset, y: 0)
    }
}

