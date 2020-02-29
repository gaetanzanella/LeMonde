//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 29/02/2020.
//

import Foundation

struct LocalPlaceToPlaceMapper {

    let local: LocalPlace

    func map() -> Place {
        Place(name: local.name, address: local.address, zipCode: local.zipCode)
    }
}

struct PlaceToLocalPlaceMapper {

    let place: Place

    func map() -> LocalPlace {
        LocalPlace(name: place.name, address: place.address, zipCode: place.zipCode)
    }
}
