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
            place: event.place?.name,
            image: event.imageURL,
            tags: event.status.tags() + [TagViewModel(text: event.type)],
            dates: event.dates.map { DateViewModelMapper(date: $0).long() },
            registrationDate: DateViewModelMapper(date: event.registrationLimitDate).long(),
            description: event.description
        )
    }
}

private extension Event.Status {

    func tags() -> [TagViewModel] {
        switch self {
        case .available:
            return []
        case .full:
            return [TagViewModel(text: "event_status_full".lm_localized())]
        case .cancel:
            return [TagViewModel(text: "event_status_cancel".lm_localized())]
        }
    }
}
