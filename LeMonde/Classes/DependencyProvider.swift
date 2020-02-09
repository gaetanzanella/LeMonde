//
//  DependencyProvider.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 08/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Foundation
import Core

struct DependencyProvider {

    static let shared = DependencyProvider()

    private let store = EventStore()

    // MARK: - Public

    func eventListPresenter() -> some EventListPresenter {
        EventListPresenterImplementation(store: store)
    }

    func eventDetailPresenter() -> some EventDetailPresenter {
        EventDetailPresenterImplementation(store: store)
    }
}
