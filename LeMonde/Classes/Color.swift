//
//  Color.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 07/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import SwiftUI

extension Color {

    static var lm_background: Color {
        Color(.windowBackgroundColor)
    }

    static var lm_label: Color {
        Color(.labelColor)
    }

    static var lm_secondaryLabel: Color {
        Color(.secondaryLabelColor)
    }
}

extension View {
    func lm_backgroundColor(_ color: Color) -> some View {
        background(color)
    }
}
