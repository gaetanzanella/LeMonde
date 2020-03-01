//
//  ActivityIndicatorView.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 29/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import SwiftUI
import AppKit

struct ActivityIndicatorView: NSViewRepresentable {

    let isAnimating: Bool

    func makeNSView(context: Context) -> NSProgressIndicator {
        let indicator = NSProgressIndicator()
        indicator.style = .spinning
        indicator.controlSize = .small
        indicator.isDisplayedWhenStopped = false
        return indicator
    }

    func updateNSView(_ nsView: NSProgressIndicator, context: Context) {
        if isAnimating {
            nsView.startAnimation(nil)
        } else {
            nsView.stopAnimation(nil)
        }
    }
}

struct ActivityIndicatorView_Preview: PreviewProvider {

    static var previews: some View {
        ActivityIndicatorView(isAnimating: true).padding().frame(width: 400)
    }
}
