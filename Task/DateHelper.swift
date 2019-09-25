//
//  DateHelper.swift
//  Task
//
//  Created by Michael Flowers on 9/25/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

extension Date {
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}

extension String {
    func dateValue() -> Date {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.date(from: self) ?? Date()
    }
}
