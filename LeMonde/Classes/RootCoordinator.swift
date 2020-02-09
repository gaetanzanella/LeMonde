//
//  RootCoordinator.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 08/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Cocoa
import SwiftUI

class RootCoordinator {

    weak var window: NSWindow?

    init(window: NSWindow?) {
        self.window = window
    }

    func loadContent() {
        let root = EventRootView(
            master: DependencyProvider.shared.eventListPresenter(),
            detail: DependencyProvider.shared.eventDetailPresenter()
        )
        window?.center()
        window?.setFrameAutosaveName("Main Window")
        window?.contentView = NSHostingView(rootView: root)
        window?.makeKeyAndOrderFront(nil)
    }
}
