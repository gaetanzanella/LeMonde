//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 20/02/2020.
//

import Foundation

struct LocalEvent: Codable {

    enum Status: String, Codable {
        case full, available, cancel
    }

    let id: String
    let status: Status
    let imageURL: URL?
    let name: String
    let type: EventType
    let place: LocalPlace?
    let mainDate: Date
    let dates: [Date]
    let registrationLimitDate: Date
    let description: String
    let url: URL
}

struct LocalPlace: Codable {
    let name: String
    let address: String
    let zipCode: String
}
