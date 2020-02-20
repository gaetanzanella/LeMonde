//
//  File.swift
//
//
//  Created by Gaétan Zanella on 09/02/2020.
//

import Foundation

extension Result {
    func map<U>(_ f: (Success) throws -> U) -> Result<U, Error> {
        switch self {
        case let .failure(error):
            return .failure(error)
        case let .success(data):
            do {
                return .success(try f(data))
            } catch {
                return .failure(error)
            }
        }
    }
}

struct HTTPRequest {
    let url: URL
    let headers: [String: String]

    init(url: URL, headers: [String: String] = [:]) {
        self.url = url
        self.headers = headers
    }
}

class HTTPClient {

    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func fetch<Resource: Decodable>(_ resourceType: Resource.Type,
                                    for request: HTTPRequest,
                                    completion: @escaping (Result<Resource, Error>) -> Void) {
        fetchData(for: request) { result in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DateFormatter.long)
            completion(result.map { try decoder.decode(resourceType, from: $0) })
        }
    }

    func fetchData(for request: HTTPRequest,
                   completion: @escaping (Result<Data, Error>) -> Void) {
        var urlRequest = URLRequest(url: request.url)
        request.headers.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) }
        let task = session.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                error.flatMap { completion(.failure($0)) }
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
