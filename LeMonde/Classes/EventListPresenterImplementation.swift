//
//  EventListPresenterImplementation.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 06/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Combine

class EventListPresenterImplementation: EventListPresenter {

    @Published var events: [EventRowViewModel] = [
        EventRowViewModel(id: "1", name: "George", date: "12 Janv"),
        EventRowViewModel(id: "2", name: "Brassens", date: "13 Janv")
    ]
}
