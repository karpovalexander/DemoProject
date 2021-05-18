//
//  Error.swift
//  TestProject


import Foundation

enum Error : Swift.Error, LocalizedError {
    case somethingWentsWrong
    case parsing
    case noConnection
    case noData
    
    
    var errorDescription: String? {
        // тут должна быть обработка типа ошибки и вывод соотсветствующего текста ошибки
        return L10n.Error.somethingWentsWrong
    }
}
