//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 08/02/2020.
//

import Foundation

public class EventStore {

    public typealias Observer = () -> Void

    private var events: [Event] = []
    private var observers: [Observer] = []

    private let calendar: EventCalendar
    private let eventGateway: EventRemoteGateway
    private let eventLocalGateway: EventLocalGateway

    public convenience init() {
        self.init(
            calendar: EventCalendar(),
            eventGateway: EventRemoteGateway(httpClient: HTTPClient()),
            eventLocalGateway: EventLocalGateway(storageURL: FileManager.default.url(for: .eventStorage))
        )
    }

    internal init(calendar: EventCalendar,
                  eventGateway: EventRemoteGateway,
                  eventLocalGateway: EventLocalGateway) {
        self.calendar = calendar
        self.eventGateway = eventGateway
        self.eventLocalGateway = eventLocalGateway
        reloadEvents()
    }

    // MARK: - Public

    public func synchronize(completion: @escaping () -> Void) {
        eventGateway.fetchLastestEvents { result in
            switch result {
            case .failure:
                break
            case let .success(events):
                self.handleEventsFetch(events)
                completion()
            }
            self.notifyObserver()
        }
    }

    public func addObserver(_ block: @escaping Observer) {
        observers.append(block)
    }

    public func fetchEvents() -> [Event] {
        events
    }

    public func fetchEvent(with id: Event.ID) -> Event? {
        events.first { $0.id == id }
    }

    public func addToFavorite(_ event: Event) {
        calendar.scheduleRegistrationReminder(for: event)
        handleEventsFetch(events)
        notifyObserver()
    }

    public func removeFromFavorites(_ event: Event) {
        calendar.cancelRegistrationReminder(for: event)
        handleEventsFetch(events)
        notifyObserver()
    }

    // MARK: - Private

    private func handleEventsFetch(_ events: [Event]) {
        let update = EventLocalGatewayUpdate(events: events)
        eventLocalGateway.perform(update)
        reloadEvents()
    }

    private func reloadEvents() {
        self.events = eventLocalGateway.fetchEvents().map {
            $0.withIsFavorite(calendar.isEventRegistrationReminderScheduled($0))
        }
    }

    private func notifyObserver() {
        observers.forEach { $0() }
    }
}
