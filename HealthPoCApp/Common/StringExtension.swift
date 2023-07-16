//
//  StringExtension.swift
//  HealthPoCApp
//
//  Created by Miroslav Durkovic on 16/07/2023.
//

import Foundation

extension String {
    func toDate(withFormat format: String? = "dd.MM.yyyy HH:mm") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return Date() // Return current date as default
        }
    }
}
