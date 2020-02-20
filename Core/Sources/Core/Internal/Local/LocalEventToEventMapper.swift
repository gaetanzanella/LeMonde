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
            isFavorite: false,
            name: resource.name,
            type: resource.type,
            mainDate: resource.mainDate,
            dates: resource.dates,
            registrationLimitDate: resource.registrationLimitDate,
            description: resource.description,
            url: resource.url
        )
    }
}
