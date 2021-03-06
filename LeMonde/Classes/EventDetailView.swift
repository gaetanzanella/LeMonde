//
//  EventDetailView.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 07/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import SwiftUI
import Core

struct EventDetailView<Presenter: EventDetailPresenter>: View {

    @ObservedObject var presenter: Presenter

    let id: String

    init(id: String, presenter: Presenter) {
        self.id = id
        self.presenter = presenter
        self.presenter.start(id: self.id)
    }

    var body: some View {
        VStack {
            ScrollView {
                presenter.viewModel.image.flatMap { image in
                    HStack {
                        URLImageView(image).frame(height: 200)
                        Spacer()
                    }
                    .padding([.leading, .top])
                }
                VStack(alignment: .leading, spacing: 8.0) {
                    EventHeaderView(detail: presenter.viewModel)
                    Text(presenter.viewModel.description)
                    Spacer()
                }
                .padding()
            }
            HStack {
                Toggle(isOn: $presenter.isFavorite) {
                    Text("add_to_calendar_action_title")
                }
                Spacer()
                Text(presenter.viewModel.registrationDate.label)
                Button("show_event_action_title") {
                    self.presenter.show()
                }
            }
            .padding()
        }
    }
}
