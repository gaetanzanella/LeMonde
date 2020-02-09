//
//  EventDetailPresenterImplementation.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 07/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Core
import Foundation

class EventDetailPresenterImplementation: EventDetailPresenter {

    @Published private var event: Event?

    private var store: EventStore

    init(store: EventStore) {
        self.store = store
    }

    // MARK: - EventDetailPresenter

    var viewModel: EventDetailViewModel {
        event.flatMap { EventDetailViewModelMapper(event: $0).viewModel() } ?? .empty
    }

    func start(id: String) {
        event = store.fetchEvent(with: Event.ID(id: id))
    }

    func didSelect(_ action: EventDetailAction) {}
}
