//
//  Date+.swift
//  JTAppleCalendarExample
//
//  Created by 양호준 on 2023/06/22.
//

import Foundation

extension Date {
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }

    var month: Int {
         return Calendar.current.component(.month, from: self)
    }

    var day: Int {
         return Calendar.current.component(.day, from: self)
    }

    func formatted(dateFormat: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        let stringDate = dateFormatter.string(from: self)

        return dateFormatter.date(from: stringDate)
    }
}
