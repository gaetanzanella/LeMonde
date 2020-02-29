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
    let place: String?
    let image: URL?
    let tags: [TagViewModel]
    let dates: [DateViewModel]
    let registrationDate: DateViewModel
    let description: String

    static let empty = EventDetailViewModel(
        id: "",
        name: "",
        place: nil,
        image: nil,
        tags: [],
        dates: [],
        registrationDate: DateViewModel(label: ""),
        description: ""
    )
}
