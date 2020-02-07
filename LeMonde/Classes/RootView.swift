//
//  RootView.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 07/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import SwiftUI

struct RootView<Master: View, Detail: View>: View {

    let master: Master
    let detail: Detail

    var body: some View {
        NavigationView {
            master.frame(minWidth: 225, maxWidth: 300)
            detail
        }.frame(minWidth: 700, minHeight: 500)
    }
}
