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

    required init(hero: Hero) {
        self.hero = hero
    }

    func viewWillAppear() {
        if let url = URL(string: hero.getThumbnailStringFor(size: .landscapeIncredible)) {
            view?.setImage(image: url)
        }

        view?.setMainText(mainText: hero.getName())
        view?.setDescription(text: hero.getDescription())
        let moreInfoText = buildMoreInfoText(hero: hero)
        view?.setMoreInfo(text: moreInfoText)

    }

    func viewDidLoad() {

    }

    private func buildMoreInfoText(hero: Hero) -> String {
        var moreInfo = ""
        moreInfo.append("Comics:\n")

        for comic in hero.getComics() {
            moreInfo.append("\(comic.getName())\n")
        }

        return moreInfo
    }
}

// MARK: - DetailHeroInteractorOutputContract
extension DetailHeroPresenter: DetailHeroInteractorOutputContract {

}

// MARK: - DetailHeroWireframeOutputContract
extension DetailHeroPresenter: DetailHeroWireframeOutputContract {
}
