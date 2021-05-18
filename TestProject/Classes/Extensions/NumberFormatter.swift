//
//  NumberFormatter.swift
//  TestProject


import Foundation

extension NumberFormatter {
    
    class func formattedCurrency(value: Float?) -> String? {
        guard let _value = value else { return nil }
        let stringValue = String(_value.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", _value) : String(_value))
        let floatValue: Float = Float(stringValue) ?? 0
        let formatter = NumberFormatter.currencyNumberFormatter
        return formatter.string(from: NSNumber(value: floatValue))
    }
    
    // MARK: - Private
    
    private static var currencyNumberFormatter: NumberFormatter = {
       let formatter = NumberFormatter()
       formatter.locale = Locale(identifier: "ru_RU")
       formatter.minimumFractionDigits = 0
       formatter.maximumFractionDigits = 2
       formatter.numberStyle = .currencyAccounting
       formatter.negativeSuffix = formatter.negativeSuffix.trimmingCharacters(in: .whitespaces)
       formatter.positiveSuffix = formatter.positiveSuffix.trimmingCharacters(in: .whitespaces)
        return formatter
    }()
}
