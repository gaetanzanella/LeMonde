//
//  AlertView.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 01/03/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import SwiftUI

struct AlertView: View {

    let text: LocalizedStringKey
    let actionText: LocalizedStringKey
    let action: () -> Void

    var body: some View {
        HStack {
            Text(text)
            Spacer()
            Button(action: action) {
                Text(actionText)
            }
        }.frame(minWidth: 400).padding()
    }
}
