//
//  EventRowViewModel.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 05/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Foundation

struct EventRowViewModel: Identifiable, Hashable {
    let id: String
    let name: String
    let date: DateViewModel
}
