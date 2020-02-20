//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 20/02/2020.
//

import Foundation

struct LocalEvent: Codable {
    let id: String
    let name: String
    let type: EventType
    let mainDate: Date
    let dates: [Date]
    let registrationLimitDate: Date
    let description: String
    let url: URL
}
