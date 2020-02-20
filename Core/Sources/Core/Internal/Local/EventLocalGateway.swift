//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 20/02/2020.
//

import Foundation

struct EventLocalGatewayUpdate {
    let events: [Event]
}

class EventLocalGateway {

    private let storageURL: URL

    private var fileURL: URL {
        storageURL.appendingPathComponent("events.json")
    }

    init(storageURL: URL) {
        self.storageURL = storageURL
    }

    func fetchEvents() -> [Event] {
        do {
            let data = try Data(contentsOf: fileURL)
            let events = try JSONDecoder().decode([LocalEvent].self, from: data)
            return events.map { LocalEventToEventMapper(resource: $0).map() }
        } catch {
            fatalError()
        }
    }

    func perform(_ update: EventLocalGatewayUpdate) {
        let localEvents = update.events.map { EventToLocalEventMapper(event: $0).map() }
        do {
            let data = try JSONEncoder().encode(localEvents)
            try data.write(to: fileURL)
        } catch {
            fatalError()
        }
    }
}
