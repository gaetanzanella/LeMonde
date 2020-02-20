//
//  File.swift
//  
//
//  Created by Gaétan Zanella on 17/02/2020.
//

import Cocoa

public class EventDeeplink {

    public init() {}

    public func open(_ event: Event) {
        NSWorkspace.shared.open(
            [event.url],
            withAppBundleIdentifier: "com.apple.Safari",
            options: [],
            additionalEventParamDescriptor: nil,
            launchIdentifiers: nil
        )
    }
}
