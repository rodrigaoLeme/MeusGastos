//
//  StringExtension.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 01/12/22.
//

import Foundation

extension String {
    static var empty = String()
    
    static func setCurrencyString(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current // Change this to another locale if you want to force a specific locale, otherwise this is redundant as the current locale is the default already
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: value as NSNumber) {
            return "\(formattedTipAmount)"
        }
        
        return String(value)
    }
    
    static func setDateFormat(value: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "dd MMM"
        
        return dateFormatter.string(from: value)
    }
}
