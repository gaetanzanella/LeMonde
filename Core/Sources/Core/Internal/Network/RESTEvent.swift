//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 10/02/2020.
//

import Foundation

struct RESTEvent: Decodable {
    let event_id: String
    let title: String
    let reservation_start_date: Date
    let description: String
    let start_date: String
    let end_date: String?
    let start_date_hour: String
    let event_type: String
    let end_date_hour: String?
}
