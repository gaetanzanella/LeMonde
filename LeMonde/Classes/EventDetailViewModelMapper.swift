//
//  EventDetailViewModelMapper.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 08/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Core

struct EventDetailViewModelMapper {

    let event: Event

    func viewModel() -> EventDetailViewModel {
        EventDetailViewModel(
            id: event.id.id,
            name: event.name,
            eventType: event.type,
            dates: event.dates.map { DateViewModelMapper(date: $0).long() },
            registrationDate: DateViewModelMapper(date: event.registrationLimitDate).long(),
            description: event.description
        )
    }
}
