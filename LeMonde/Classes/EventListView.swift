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

    var body: some View {
        List(presenter.events) { event in
            EventRow(event: event)
        }
    }
}
