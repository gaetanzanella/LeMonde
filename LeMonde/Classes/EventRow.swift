//
//  EventRow.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 07/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import SwiftUI

struct EventRow: View {

    let event: EventRowViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(event.name)
                Text(event.date.label)
            }.foregroundColor(event.isIndicative ? .lm_secondaryLabel : .lm_label)
            Spacer()
            if event.isFavorite {
                Image("star").resizable().frame(width: 15, height: 15)
            }
        }
    }
}

struct EventRow_Preview: PreviewProvider {

    static var previews: some View {
        EventRow(
            event: EventRowViewModel(
                id: "A",
                name: "Deux amoureux Paris",
                isFavorite: true,
                isIndicative: false,
                date: DateViewModel(label: "23 Janvier")
            )
        ).frame(width: 400)
    }
}
