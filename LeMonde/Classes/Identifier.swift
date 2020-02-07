//
//  Identifier.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 05/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Foundation

struct Identifier<ShadowType, ID: Hashable>: Hashable {
    let id: ID
}
