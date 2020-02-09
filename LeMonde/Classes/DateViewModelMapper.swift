//
//  DateViewModelMapper.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 09/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Foundation

struct DateViewModelMapper {

    let date: Date

    func long() -> DateViewModel {
        DateViewModel(label: DateFormatter.long.string(from: date))
    }

    func short() -> DateViewModel {
        DateViewModel(label: DateFormatter.short.string(from: date))
    }
}
