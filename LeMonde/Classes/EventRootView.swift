//
//  EventRootView.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 08/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import SwiftUI

struct EventRootView<MasterPresenter: EventListPresenter, DetailPresenter: EventDetailPresenter>: View {

    @State private var selectedRow: EventRowViewModel?

    let master: MasterPresenter
    let detail: DetailPresenter

    var body: some View {
        let id = selectedRow?.id
        return RootView(
            master: EventListView(presenter: master, selectedEvent: $selectedRow),
            detail: id.flatMap { EventDetailView(id: $0, presenter: detail) }
        )
    }
}
