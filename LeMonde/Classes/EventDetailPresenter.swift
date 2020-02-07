//
//  EventDetailPresenter.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 07/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Combine

enum EventDetailAction {
    case addToCalendar
}

protocol EventDetailPresenter: ObservableObject {
    var viewModel: EventDetailViewModel { get }

    func didSelect(_ action: EventDetailAction)
}
