//
//  ContentView.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 05/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import SwiftUI

struct EventListView<Presenter: EventListPresenter>: View {

    @ObservedObject var presenter: Presenter
    @Binding var selectedEvent: EventRowViewModel?

    var body: some View {
        List(presenter.events, id: \.self, selection: $selectedEvent) { event in
            EventRow(event: event)
        }.onAppear {
            self.presenter.start()
        }
    }
}
