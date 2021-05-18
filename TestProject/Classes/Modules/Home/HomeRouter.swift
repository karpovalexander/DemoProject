//
//  HomeRouter.swift
//  TestProject


import UIKit

protocol HomeRouterProtocol {
    func showInfo()
}

final class HomeRouter: BaseRouter, HomeRouterProtocol {
    
    // MARK: - HomeRouterProtocol
    
    func showInfo() {
        guard let viewController = UIViewController.instantiateInitialViewController(fromStoryboard: .info) else { return }
        sourceViewController?.present(viewController, animated: true, completion: nil)
    }
}
