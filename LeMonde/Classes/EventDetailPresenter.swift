//
//  EventDetailPresenter.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 07/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Combine

protocol EventDetailPresenter: ObservableObject {

    var viewModel: EventDetailViewModel { get }

    var isFavorite: Bool { get set }

    func start(id: String)
    func show()
}
