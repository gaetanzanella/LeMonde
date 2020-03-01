//
//  RootCoordinator.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 08/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Cocoa
import SwiftUI

//struct MainView: View {
//
//    @State private var showingWelcome = false
//
//    let rows = ["A", "B"]
//
//    var body: some View {
//        ZStack(alignment: .leading) {
//            List(rows, id: \.self) {
//                Text($0)
//            }
//            Toggle(isOn: $showingWelcome) {
//                Text("Toggle label")
//            }
//            if showingWelcome {
//                VStack {
//                    Spacer()
//                    EventActivityIndicatorFooter()
//                }.transition(.move(edge: .bottom)).animation(.easeInOut)
//            }
//        }.frame(minWidth: 300, minHeight: 300)
//    }
//}

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
