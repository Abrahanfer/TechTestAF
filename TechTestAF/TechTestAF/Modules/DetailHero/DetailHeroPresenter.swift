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

    func viewWillAppear() {

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
