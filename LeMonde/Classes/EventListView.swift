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
    @Binding var selectedEvent: EventRowViewModel.ID?

    var body: some View {
        VStack(spacing: 0) {
            List(presenter.events, id: \.id, selection: $selectedEvent) { event in
                EventRow(event: event).contextMenu {
                    Button(action: {
                        self.presenter.toggleEvent(event.id)
                    }) {
                        Text(event.isFavorite ? "cancel_action_title" : "schedule_action_title")
                    }
                }
            }
            EventActivityIndicatorFooter(
                text: presenter.footerText,
                isAnimating: presenter.isLoading,
                action: {
                    self.presenter.refresh()
                }
            )
        }.onAppear {
            self.presenter.start()
        }.sheet(isPresented: $presenter.hasError, content: {
            AlertView(text: "synchronization_error_label", actionText: "ok_action_title") {
                self.presenter.hasError = false
            }
        })
    }
}
