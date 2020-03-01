//
//  EventListPresenterImplementation.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 06/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Combine
import Core
import Foundation

class EventListPresenterImplementation: EventListPresenter {

    private let store: EventStore

    @Published var events: [EventRowViewModel] = []

    @Published var isLoading = false
    @Published var hasError = false

    init(store: EventStore) {
        self.store = store
    }

    var footerText: String {
        return String(format: "event_list_count".lm_localized(), events.count)
    }

    func start() {
        reloadView()
        store.addObserver { [weak self] in
            self?.reloadView()
        }
        refresh()
    }

    func refresh() {
        isLoading = true
        store.synchronize { [weak self] result in
            switch result {
            case .failure:
                self?.hasError = true
            case .success:
                break
            }
            self?.isLoading = false
        }
    }

    private func reloadView() {
        events = EventListViewModelMapper(events: self.store.fetchEvents()).viewModels()
    }
}
