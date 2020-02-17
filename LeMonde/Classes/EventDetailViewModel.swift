//
//  EventDetailViewModel.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 07/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Foundation

struct EventDetailViewModel {
    let id: String
    let name: String
    let eventType: String
    let dates: [DateViewModel]
    let registrationDate: DateViewModel
    let description: String

    static let empty = EventDetailViewModel(
        id: "",
        name: "",
        eventType: "",
        dates: [],
        registrationDate: DateViewModel(label: ""),
        description: ""
    )
}
