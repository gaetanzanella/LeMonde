//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 20/02/2020.
//

import Foundation

extension FileManager {

    enum Folder {
        case eventStorage
    }

    func cachesFolder() -> URL {
        urls(for: .cachesDirectory, in: .userDomainMask).first!
    }

    func url(for folder: Folder) -> URL {
        let url: URL
        switch folder {
        case .eventStorage:
            url = cachesFolder().appendingPathComponent("EventStorage")
        }
        createIfNeededDirectory(at: url)
        return url
    }

    func createIfNeededDirectory(at url: URL) {
        try? createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
    }
}
