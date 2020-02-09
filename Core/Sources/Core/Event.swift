
import Foundation

public struct Event {

    public typealias ID = Identifier<Self, String>

    public let id: ID
    public let name: String
    public let mainDate: Date
    public let dates: [Date]
    public let registrationLimitDate: Date
    public let description: String
}
