//
//  Event.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 05/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Foundation

struct Event {

    typealias ID = Identifier<Self, String>

    let id: ID
    let name: String
    let date: Date
}
