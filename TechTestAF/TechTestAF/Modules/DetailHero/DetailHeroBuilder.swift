//
//  DetailHeroBuilder.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 9/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//
//

import UIKit

class DetailHeroBuilder {

    static func build() -> DetailHeroView {
        let view = DetailHeroView(nibName: String(describing: DetailHeroView.self), bundle: nil)
        let presenter = DetailHeroPresenter()
        let wireframe = DetailHeroWireframe()

        let interactor = DetailHeroInteractor()

        view.presenter = presenter
        view.presenter?.view = view
        view.presenter?.interactor = interactor
        view.presenter?.interactor?.output = presenter
        view.presenter?.wireframe = wireframe

        view.presenter?.wireframe?.output = presenter
        view.presenter?.wireframe?.view = view

        return view
    }
}
