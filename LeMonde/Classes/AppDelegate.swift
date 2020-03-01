//
//  AppDelegate.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 05/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow?
    var coordinator: RootCoordinator?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 500),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false
        )
        coordinator = RootCoordinator(window: window)
        coordinator?.loadContent()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

