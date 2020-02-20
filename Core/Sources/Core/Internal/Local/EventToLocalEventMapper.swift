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
            name: event.name,
            type: event.type,
            mainDate: event.mainDate,
            dates: event.dates,
            registrationLimitDate: event.registrationLimitDate,
            description: event.description,
            url: event.url
        )
    }
}
