//
//  String+Localized.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 29/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Foundation

extension String {

    func lm_localized() -> String {
        NSLocalizedString(self, comment: "")
    }
}
