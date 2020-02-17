
import Foundation

public typealias EventType = String

public struct Event {

    public typealias ID = Identifier<Self, String>

    public let id: ID
    public let isFavorite: Bool
    public let name: String
    public let type: EventType
    public let mainDate: Date
    public let dates: [Date]
    public let registrationLimitDate: Date
    public let description: String
    public let url: URL
}

extension Event {

    func withIsFavorite(_ isFavorite: Bool) -> Event {
        Event(
            id: id,
            isFavorite: isFavorite,
            name: name,
            type: type,
            mainDate: mainDate,
            dates: dates,
            registrationLimitDate: registrationLimitDate,
            description: description,
            url: url
        )
    }
}
