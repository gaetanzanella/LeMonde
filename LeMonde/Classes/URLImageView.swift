//
//  URLImageView.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 20/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct URLImageView: SwiftUI.View {

    let url: URL

    init(_ url: URL) {
        self.url = url
    }

    var body: some SwiftUI.View {
        KFImage(url)
            .configure { $0.resizable() }
            .aspectRatio(contentMode: .fit)
    }
}
