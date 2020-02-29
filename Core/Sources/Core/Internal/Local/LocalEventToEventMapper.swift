//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 20/02/2020.
//

import Foundation

struct LocalEventToEventMapper {

    let resource: LocalEvent

    func map() -> Event {
        Event(
            id: Event.ID(id: resource.id),
            status: resource.status.eventStatus,
            imageURL: resource.imageURL,
            isFavorite: false,
            name: resource.name,
            place: resource.place.flatMap { LocalPlaceToPlaceMapper(local: $0).map() },
            type: resource.type,
            mainDate: resource.mainDate,
            dates: resource.dates,
            registrationLimitDate: resource.registrationLimitDate,
            description: resource.description,
            url: resource.url
        )
    }
}

private extension LocalEvent.Status {

    var eventStatus: Event.Status {
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
