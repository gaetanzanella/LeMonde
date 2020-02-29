//
//  TagViewModel.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 21/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Foundation

struct TagViewModel: Identifiable, Hashable {
    let text: String

    var id: String {
        return text
    }
}
