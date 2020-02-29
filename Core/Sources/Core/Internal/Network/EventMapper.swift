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

    enum MappingError: Error {
        case wrongFormat
    }

    let resource: RESTEvent

    func event() throws -> Event {
        let startDate: Date
        let status: Event.Status
        let registrationLimitDate: Date
        let place: Place?
        switch resource.event_status.value {
        case let .lhs(string):
            guard let date = resource.reservation_start_date else { throw MappingError.wrongFormat }
            guard let sDate = DateFormatter.eventDate.date(from: resource.startDate) else { throw MappingError.wrongFormat }
            status = Event.Status(value: string)!
            registrationLimitDate = date
            startDate = sDate
            place = resource.place()
        case let .rhs(events):
            guard let event = events.first else { throw MappingError.wrongFormat }
            let result = try EventMapper(resource: event).event()
            status = result.status
            registrationLimitDate = result.registrationLimitDate
            startDate = result.mainDate
            place = result.place
        }
        return Event(
            id: Event.ID(id: resource.event_id),
            status: status,
            imageURL: URL(string: "https://evenements-abonnes.lemonde.fr/resources/images/frontoffice/events/\(resource.file_name ?? "")"),
            isFavorite: false,
            name: resource.title ?? "",
            place: place,
            type: resource.event_type ?? "",
            mainDate: startDate,
            dates: [startDate],
            registrationLimitDate: registrationLimitDate,
            description: resource.description?.html() ?? "",
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

private extension Event.Status {

    init?(value: String) {
        switch value {
        case "FULL":
            self = .full
        case "AVAILABLE":
            self = .available
        case "CANCEL":
            self = .cancel
        default:
            return nil
        }
    }
}

private extension RESTEvent {

    func place() -> Place? {
        guard let name = event_place_name, let address = event_address, let code = event_postal_code else {
            return nil
        }
        return Place(
            name: name,
            address: address,
            zipCode: code
        )
    }
}

private extension RESTEvent {

    var startDate: String {
        guard let start_date = start_date, let start_date_hour = start_date_hour else { return "" }
        return "\(start_date_hour) \(start_date)"
    }
}
