//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 08/02/2020.
//

import Foundation

public struct Identifier<ShadowType, ID: Hashable>: Hashable {

    public let id: ID

    public init(_ shadowType: ShadowType, id: ID) {
        self.id = id
    }

    public init(id: ID) {
        self.id = id
    }
}
