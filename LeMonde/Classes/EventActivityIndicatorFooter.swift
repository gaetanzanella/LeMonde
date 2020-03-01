//
//  EventListActivityFooter.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 29/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import SwiftUI

struct EventActivityIndicatorFooter: View {

    let text: String
    let isAnimating: Bool
    let action: () -> Void

    var body: some View {
        HStack {
            Text(text)
            Spacer()
            ActivityIndicatorView(isAnimating: isAnimating)
            Button(action: {
                self.action()
            }) {
                Image("refresh").resizable().frame(width: 15, height: 15).aspectRatio(contentMode: .fit)
            }
        }
        .padding()
        .lm_backgroundColor(.lm_background)
    }
}
