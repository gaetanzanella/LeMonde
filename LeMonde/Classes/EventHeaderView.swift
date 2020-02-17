//
//  EventHeaderView.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 08/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import SwiftUI

struct EventHeaderView: View {

    let detail: EventDetailViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(detail.name).font(.title)
            Divider()
            HStack {
                ForEach(detail.dates, id: \.label) { date in
                    Text(date.label).padding([.top, .bottom], 4.0)
                }
                Spacer()
                StatusView(detail.eventType)
            }
            Divider()
        }
    }
}
