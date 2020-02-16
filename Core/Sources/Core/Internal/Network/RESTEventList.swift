//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 11/02/2020.
//

import Foundation

struct RESTEventList: Decodable {

    struct Meta: Decodable {
        let details: [RESTEvent]
        let pages: Int
    }

    let mdata: Meta
}
