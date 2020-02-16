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
        Event(
            id: Event.ID(id: resource.event_id),
            isFavorite: false,
            name: resource.title,
            mainDate: resource.reservation_start_date,
            dates: [resource.reservation_start_date],
            registrationLimitDate: resource.reservation_start_date,
            description: resource.description.html(),
            url: URL(fileURLWithPath: "")
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
