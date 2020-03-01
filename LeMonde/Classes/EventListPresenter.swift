//
//  EventListPresenter.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 05/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Foundation
import Combine

protocol EventListPresenter: ObservableObject {

    var events: [EventRowViewModel] { get }

    var footerText: String { get }
    var isLoading: Bool { get }
    var hasError: Bool { get set }

    func start()
    func refresh()
}
