//
//  DateFormatter.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 09/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Foundation

extension DateFormatter {

    static let long: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, HH:mm"
        return formatter
    }()

    static let short: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
}

