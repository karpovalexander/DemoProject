//
//  Notification+Extension.swift
//  TestProject


import UIKit

extension Notification {
    func parseKeyboardNotification() -> (CGFloat, TimeInterval, UIView.AnimationOptions)? {
        guard let info = self.userInfo else {
            return nil
        }
        
        guard var height = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height else {
            return nil
        }
        if self.name == UIResponder.keyboardWillHideNotification {
            height = 0
        }
        
        guard let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {
            return nil
        }
        
        guard let curveRaw = info[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int else {
            return nil
        }
        
        let curve = UIView.AnimationOptions(rawValue: UInt(curveRaw) << 16)

        return (height, duration, curve)
    }
}
