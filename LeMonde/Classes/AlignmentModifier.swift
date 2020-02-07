//
//  PinningView.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 07/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import SwiftUI

struct AlignmentModifier: ViewModifier {

    var alignment: Alignment

    func body(content: Content) -> some View {
        GeometryReader { proxy in
            content
            .frame(
                width: proxy.size.width,
                height: proxy.size.height,
                alignment: self.alignment
            )
        }
    }
}

extension View {

    func lm_align(to alignment: Alignment) -> some View {
        return modifier(AlignmentModifier(alignment: alignment))
    }
}
