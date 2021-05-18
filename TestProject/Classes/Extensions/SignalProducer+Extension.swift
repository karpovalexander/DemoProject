//
//  SignalProducer+Extension.swift
//  TestProject


import Foundation

import ReactiveSwift

extension SignalProducer {
    func asVoid() -> SignalProducer<Void, Error> {
        return self.map { _ in () }
    }
}
