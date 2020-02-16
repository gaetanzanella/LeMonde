//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 12/02/2020.
//

import Foundation

extension DateFormatter {

    static let long: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()

    static let eventDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH'h'mm dd/mm/yyyy"
        return formatter
    }()
}
