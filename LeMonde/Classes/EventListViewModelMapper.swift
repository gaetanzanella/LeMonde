//
//  EventListViewModelMapper.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 08/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Foundation
import Core

struct EventListViewModelMapper {

    let events: [Event]

    func viewModels() -> [EventRowViewModel] {
        events.map { event in
            EventRowViewModel(
                id: event.id.id,
                name: event.name,
                isFavorite: event.isFavorite,
                date: DateViewModelMapper(date: event.mainDate).short()
            )
        }
    }
}
