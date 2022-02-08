//
//  ListHeroesPresenter.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 8/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class ListHeroesPresenter: BasePresenter, ListHeroesPresenterContract {

    weak var view: ListHeroesViewContract!
    var interactor: ListHeroesInteractorContract!
    var wireframe: ListHeroesWireframeContract!

    func viewWillAppear() {

    }

    func viewDidLoad() {

    }
}

// MARK: - ListHeroesInteractorOutputContract
extension ListHeroesPresenter: ListHeroesInteractorOutputContract {

}

// MARK: - ListHeroesWireframeOutputContract
extension ListHeroesPresenter: ListHeroesWireframeOutputContract {

}
