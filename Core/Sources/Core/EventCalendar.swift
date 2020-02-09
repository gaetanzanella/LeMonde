//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 09/02/2020.
//

import Foundation
import EventKit

private extension EKEventStore {
    func leMondeCalendar() -> EKCalendar {
        let source = sources.first(where: { $0.title == "iCloud" })!
        return source.calendars(for: .event).first(where: { $0.title == "LeMonde" })!
    }
}

class EventCalendar {

    private lazy var store = EKEventStore()

    init() {
        store.requestAccess(to: .event) { bool, error in }
    }

    func scheduleRegistrationReminder(for event: Event) {
        let ekEvent = EKEvent(eventStore: store)
        ekEvent.startDate = ekEventStartDate(for: event)
        ekEvent.endDate = ekEventEndDate(for: event)
        ekEvent.url = event.url
        ekEvent.title = event.name
        ekEvent.notes = event.id.id
        ekEvent.calendar = store.leMondeCalendar()
        if #available(OSX 10.14, *) {
            do {
                try store.save(ekEvent, span: .thisEvent)
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }

    func cancelRegistrationReminder(for event: Event) {
        guard let event = fetchEKEvent(associatedTo: event) else { return }
        if #available(OSX 10.14, *) {
            try? store.remove(event, span: .futureEvents)
        }
    }

    func isEventRegistrationReminderScheduled(_ event: Event) -> Bool {
        return fetchEKEvent(associatedTo: event) != nil
    }

    private func fetchEKEvent(associatedTo event: Event) -> EKEvent? {
        let predicate = store.predicateForEvents(
            withStart: ekEventStartDate(for: event),
            end: ekEventEndDate(for: event),
            calendars: nil
        )
        return store.events(matching: predicate).first { $0.notes == event.id.id }
    }

    private func ekEventStartDate(for event: Event) -> Date {
        event.registrationLimitDate
    }

    private func ekEventEndDate(for event: Event) -> Date {
        event.registrationLimitDate.addingTimeInterval(60)
    }
}
