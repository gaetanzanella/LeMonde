//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 10/02/2020.
//

import Foundation

private enum Constant {
    static func eventURL(page: Int) -> URL {
        URL(string: "https://evenements-abonnes.lemonde.fr/events/homepage/filter_events?month=0&type=0&city=1&page=\(page)")!
    }
}

class EventRemoteGateway {

    private let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    func fetchLastestEvents(completion: @escaping (Result<[Event], Error>) -> Void) {
        fetchEventList(atPage: 1) { [weak self] result in
            switch result {
            case let .failure(error):
                completion(.failure(error))
            case let .success(list):
                var events = self?.makeEvents(list: list) ?? []
                let group = DispatchGroup()
                let lock = NSLock()
                let pages = min(list.mdata.pages, 5)
                (2...pages).forEach { page in
                    group.enter()
                    self?.fetchEventList(atPage: page) { result in
                        switch result {
                        case .failure:
                            break
                        case let .success(list):
                            lock.lock()
                            events += self?.makeEvents(list: list) ?? []
                            lock.unlock()
                        }
                        group.leave()
                    }
                }
                group.notify(queue: .main) {
                    completion(.success(events))
                }
            }
        }
    }

    private func fetchEventList(atPage page: Int,
                                completion: @escaping (Result<RESTEventList, Error>) -> Void) {
        let request = HTTPRequest(url: Constant.eventURL(page: page))
        httpClient.fetch(RESTEventList.self, for: request) { result in
            completion(result)
        }
    }

    private func makeEvents(list: RESTEventList) -> [Event] {
        return list.mdata.details.compactMap { try? EventMapper(resource: $0).event() }
    }
}
