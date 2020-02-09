//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 08/02/2020.
//

import Foundation

public class EventStore {

    private var events: [Event] = []

    private let calendar: EventCalendar

    public convenience init() {
        self.init(calendar: EventCalendar())
    }

    internal init(calendar: EventCalendar) {
        self.calendar = calendar
    }

    // MARK: - Public

    public func synchronize(completion: @escaping () -> Void) {
        let ref = Date(timeIntervalSince1970: 1581265255.651691)
        let names = ["A", "B", "C"]
        events = names.enumerated().map { i, name in
            let eDate = ref.addingTimeInterval(Double(i) * 24 * 60 * 60)
            return Event(
                id: Event.ID(id: name),
                isFavorite: false,
                name: name,
                mainDate: eDate,
                dates: [eDate],
                registrationLimitDate: eDate,
                description: "AHAHA",
                url: URL(fileURLWithPath: name)
            )
        }
        events = events.map {
            $0.withIsFavorite(calendar.isEventRegistrationReminderScheduled($0))
        }
        completion()
    }

    public func fetchEvents() -> [Event] {
        events
    }

    public func fetchEvent(with id: Event.ID) -> Event? {
        events.first { $0.id == id }
    }

    public func addToFavorite(_ event: Event) {
        calendar.scheduleRegistrationReminder(for: event)
        synchronize {}
    }

    public func removeFromFavorites(_ event: Event) {
        calendar.cancelRegistrationReminder(for: event)
        synchronize {}
    }
}
