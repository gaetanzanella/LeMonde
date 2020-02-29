//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 20/02/2020.
//

import Foundation

struct EventToLocalEventMapper {

    let event: Event

    func map() -> LocalEvent {
        LocalEvent(
            id: event.id.id,
            status: event.status.localStatus,
            imageURL: event.imageURL,
            name: event.name,
            type: event.type,
            place: event.place.flatMap { PlaceToLocalPlaceMapper(place: $0).map() },
            mainDate: event.mainDate,
            dates: event.dates,
            registrationLimitDate: event.registrationLimitDate,
            description: event.description,
            url: event.url
        )
    }
}

private extension Event.Status {

    var localStatus: LocalEvent.Status {
        switch self {
        case .available:
            return .available
        case .full:
            return .full
        case .cancel:
            return .cancel
        }
    }
}
