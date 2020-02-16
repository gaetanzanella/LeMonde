//
//  EventListPresenterImplementation.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 06/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Combine
import Core

class EventListPresenterImplementation: EventListPresenter {

    private let store: EventStore

    @Published var events: [EventRowViewModel] = []

    init(store: EventStore) {
        self.store = store
    }

    func start() {
        store.synchronize {
            self.events = EventListViewModelMapper(events: self.store.fetchEvents()).viewModels()
        }
    }
}
