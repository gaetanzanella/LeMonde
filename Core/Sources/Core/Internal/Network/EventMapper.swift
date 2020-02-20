//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 12/02/2020.
//

import Foundation
import SwiftSoup
import Cocoa

struct EventMapper {

    let resource: RESTEvent

    func event() throws -> Event {
        guard let startDate = DateFormatter.eventDate.date(from: resource.startDate) else {
            fatalError("Wrong date format")
        }
        return Event(
            id: Event.ID(id: resource.event_id),
            isFavorite: false,
            name: resource.title,
            type: resource.event_type,
            mainDate: startDate,
            dates: [startDate],
            registrationLimitDate: resource.reservation_start_date,
            description: resource.description.html(),
            url: URL(string: "https://evenements-abonnes.lemonde.fr/event_details?event_id=\(resource.event_id)")!
        )
    }
}

private extension String {
    func html() -> String {
        do {
            let doc = try SwiftSoup.parse(self)
            let p = try doc.select("p").map { try $0.text() }
            return p.joined(separator: "\n\n")
        } catch {
            return ""
        }
    }
}

private extension RESTEvent {

    var startDate: String {
        "\(start_date_hour) \(start_date)"
    }
}
