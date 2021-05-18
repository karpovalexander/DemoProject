//
//  UIViewController+Extension.swift
//  TestProject


import UIKit
import IHProgressHUD

extension UIViewController {
    
    class func instantiateInitialViewController(fromStoryboard name: Constants.StoryboardName) -> UIViewController? {
        let storyboard = UIStoryboard(name: name.rawValue, bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        return viewController
    }
    
    func showLoader() {
        IHProgressHUD.show()
    }
    
    func hideLoader() {
        IHProgressHUD.dismiss()
    }

}
