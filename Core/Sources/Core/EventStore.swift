//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 08/02/2020.
//

import Foundation

public class EventStore {

    private var events = [
        Event(id: Event.ID(id: "A"), name: "A", mainDate: Date(), dates: [Date()], registrationLimitDate: Date(), description: "AHAHA"),
        Event(id: Event.ID(id: "B"), name: "B", mainDate: Date(), dates: [Date()], registrationLimitDate: Date(), description: "AHAHA"),
        Event(id: Event.ID(id: "C"), name: "C", mainDate: Date(), dates: [Date()], registrationLimitDate: Date(), description: "AHAHA"),
        Event(id: Event.ID(id: "D"), name: "D", mainDate: Date(), dates: [Date()], registrationLimitDate: Date(), description: "AHAHA"),
    ]

    public init() {}

    // MARK: - Public

    public func synchronize(completion: @escaping () -> Void) {
        completion()
    }

    public func fetchEvents() -> [Event] {
        events
    }

    public func fetchEvent(with id: Event.ID) -> Event? {
        events.first { $0.id == id }
    }
}
