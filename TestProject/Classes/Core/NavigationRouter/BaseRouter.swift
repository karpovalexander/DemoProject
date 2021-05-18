//
//  BaseRouter.swift
//  TestProject


import UIKit.UIViewController

class BaseRouter {
    
    weak var sourceViewController: UIViewController?
    
    init(sourceViewController: UIViewController) {
        self.sourceViewController = sourceViewController
    }
}
