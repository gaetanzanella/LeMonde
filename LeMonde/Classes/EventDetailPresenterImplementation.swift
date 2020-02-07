//
//  EventDetailPresenterImplementation.swift
//  LeMonde
//
//  Created by Gaétan Zanella on 07/02/2020.
//  Copyright © 2020 Gaetan Zanella. All rights reserved.
//

import Foundation

class EventDetailPresenterImplementation: EventDetailPresenter {

    // MARK: - EventDetailPresenter

    var viewModel: EventDetailViewModel {
        EventDetailViewModel(
            id: "Alchimie musicale",
            name: "Alchimie musicale",
            dates: [DateViewModel(label: "Le Jeudi 13 février 2020 à 20h00")],
            registrationDate: DateViewModel(label: "Jeudi 13 février 2020, à 10h00 "),
            description: "Avec sa plénitude sonore, son alchimie incomparable mêlant violon et violoncelle, le Double concerto de Brahms offre la plus belle estrade pour mettre en valeur les deux solistes de notre orchestre, Ayako Tanaka et Gregorio Robino. Scellant la réconciliation du compositeur avec le violoniste Joseph Joachim, l’œuvre associe fraîcheur chambriste et générosité symphonique. Grand interprète de la musique romantique, Jean-Claude Casadesus conclura le programme avec la célèbre Symphonie du Nouveau Monde de Dvorák. On se laisse emporter d’un negro-spiritual à une légende amérindienne, jusqu’au somptueux mouvement final.Avec sa plénitude sonore, son alchimie incomparable mêlant violon et violoncelle, le Double concerto de Brahms offre la plus belle estrade pour mettre en valeur les deux solistes de notre orchestre, Ayako Tanaka et Gregorio Robino. Scellant la réconciliation du compositeur avec le violoniste Joseph Joachim, l’œuvre associe fraîcheur chambriste et générosité symphonique. Grand interprète de la musique romantique, Jean-Claude Casadesus conclura le programme avec la célèbre Symphonie du Nouveau Monde de Dvorák. On se laisse emporter d’un negro-spiritual à une légende amérindienne, jusqu’au somptueux mouvement final.Avec sa plénitude sonore, son alchimie incomparable mêlant violon et violoncelle, le Double concerto de Brahms offre la plus belle estrade pour mettre en valeur les deux solistes de notre orchestre, Ayako Tanaka et Gregorio Robino. Scellant la réconciliation du compositeur avec le violoniste Joseph Joachim, l’œuvre associe fraîcheur chambriste et générosité symphonique. Grand interprète de la musique romantique, Jean-Claude Casadesus conclura le programme avec la célèbre Symphonie du Nouveau Monde de Dvorák. On se laisse emporter d’un negro-spiritual à une légende amérindienne, jusqu’au somptueux mouvement final."
        )
    }

    func didSelect(_ action: EventDetailAction) {
        
    }
}
