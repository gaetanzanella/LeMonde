//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 10/02/2020.
//

import Foundation

struct RESTEvent: Decodable {
    let event_id: String
    let file_name: String?
    let title: String?
    let event_status: RESTOR<String, [RESTEvent]>
    let reservation_start_date: Date?
    let description: String?
    let start_date: String?
    let end_date: String?
    let start_date_hour: String?
    let event_type: String?
    let end_date_hour: String?
    let event_address: String?
    let event_place_name: String?
    let event_postal_code: String?
}

struct RESTStatusEvent: Decodable {
    let event_id: String
    let event_status: String
    let event_address: String
    let event_place_name: String
    let event_postal_code: String
}
