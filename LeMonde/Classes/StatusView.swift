//
//  StatusView.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 16/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import SwiftUI

struct StatusView: View {

    let text: String

    init(_ text: String) { self.text = text }

    var body: some View {
        Text(text)
            .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5))
            .background(Color.accentColor)
            .cornerRadius(4.0)
    }
}
