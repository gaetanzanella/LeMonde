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
        VStack(alignment: .leading) {
            Text(event.name)
            Text(event.date)
        }
    }
}
