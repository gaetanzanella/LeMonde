//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 24/02/2020.
//

import Foundation

struct RESTOR<LHS: Decodable, RHS: Decodable>: Decodable {

    enum Value {
        case lhs(LHS), rhs(RHS)
    }

    let value: Value

    init(from decoder: Decoder) throws {
        if let lhs = try? decoder.singleValueContainer().decode(LHS.self) {
            value = .lhs(lhs)
        } else {
            value = .rhs(try decoder.singleValueContainer().decode(RHS.self))
        }
    }
}
