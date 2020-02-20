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
    private var id: String?

    private var store: EventStore

    init(store: EventStore) {
        self.store = store
    }

    // MARK: - EventDetailPresenter

    var isFavorite: Bool {
        set {
            guard let event = event else { return }
            if event.isFavorite {
                store.removeFromFavorites(event)
            } else {
                store.addToFavorite(event)
            }
            reload()
        }
        get {
            event?.isFavorite ?? false
        }
    }

    var viewModel: EventDetailViewModel {
        event.flatMap { EventDetailViewModelMapper(event: $0).viewModel() } ?? .empty
    }

    func start(id: String) {
        self.id = id
        reload()
    }

    func show() {
        guard let event = event else { return }
        EventDeeplink().open(event)
    }

    private func reload() {
        guard let id = id else { return }
        event = store.fetchEvent(with: Event.ID(id: id))
    }
}
