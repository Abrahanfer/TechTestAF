//
//  ListHeroesBuilder.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 8/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ListHeroesBuilder {

    static func build() -> ListHeroesView {
        let view = ListHeroesView.init(nibName: String(describing: ListHeroesView.self), bundle: nil)
        let presenter = ListHeroesPresenter()
        let wireframe = ListHeroesWireframe()

        let provider = HeroesProvider()
        let interactor = ListHeroesInteractor(provider: provider)

        view.presenter = presenter
        view.presenter.view = view
        view.presenter.interactor = interactor
        view.presenter.interactor.output = presenter
        view.presenter.wireframe = wireframe

        view.presenter.wireframe.output = presenter
        view.presenter.wireframe.view = view

        return view
    }
}
