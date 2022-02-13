//
//  DetailHeroPresenter.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 9/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//
//

import Foundation

class DetailHeroPresenter: BasePresenter, DetailHeroPresenterContract {

    weak var view: DetailHeroViewContract?
    var interactor: DetailHeroInteractorContract?
    var wireframe: DetailHeroWireframeContract?
    private var hero: Hero

    // FIXME: Maybe move this to interactor layer to help getting other resources related
    required init(hero: Hero) {
        self.hero = hero
    }

    func viewWillAppear() {
        if let url = URL(string: hero.getThumbnailStringFor(size: .landscapeIncredible)) {
            view?.setImage(image: url)
        }

        view?.setMainText(mainText: hero.name ?? "")
        view?.setDescription(text: hero.description ?? "")

    }

    func viewDidLoad() {

    }
}

// MARK: - DetailHeroInteractorOutputContract
extension DetailHeroPresenter: DetailHeroInteractorOutputContract {

}

// MARK: - DetailHeroWireframeOutputContract
extension DetailHeroPresenter: DetailHeroWireframeOutputContract {
}
