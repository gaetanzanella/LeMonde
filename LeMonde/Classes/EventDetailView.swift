//
//  EventDetailView.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 07/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import SwiftUI

struct EventDetailView<Presenter: EventDetailPresenter>: View {

    @ObservedObject var presenter: Presenter

    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 8.0) {
                    EventHeaderView(detail: presenter.viewModel)
                    Text(presenter.viewModel.description)
                    Spacer()
                }
                .padding()
            }
            HStack {
                Spacer()
                Button("add_to_calendar_action_title") {
                    self.presenter.didSelect(.addToCalendar)
                }
                .padding()
            }
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {

    static var previews: some View {
        EventDetailView(
            presenter: EventDetailPresenterImplementation()
        )
    }
}

struct EventHeaderView: View {

    let detail: EventDetailViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(detail.name).font(.title)
            Divider()
            ForEach(detail.dates, id: \.label) { date in
                Text(date.label).padding([.top, .bottom], 4.0)
            }
            Divider()
        }
    }
}
