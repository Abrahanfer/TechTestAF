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
    weak var view: ListHeroesViewContract?
    var interactor: ListHeroesInteractorContract?
    var wireframe: ListHeroesWireframeContract?

    private var heroes: [Hero] = []
    private var refreshingData = false

    func viewDidLoad() {
        interactor?.getHeroes(page: 0)
    }

    func viewWillAppear() {

    }

    func updateWithHeroes(heroes: [Hero]) {
        self.heroes.append(contentsOf: heroes)
        refreshingData = false
        view?.updateListWithNewElements()
    }

    func getHeroesCount() -> Int {
        return heroes.count
    }

    func getHeroAtPosition(position: Int) -> Hero {
        if heroes.indices.contains(position) {
            return heroes[position]
        } else {
            fatalError("GIVE ERROR FEEDBACK")
        }
    }

    func selectItem(position: Int) {
        if heroes.indices.contains(position) {
            wireframe?.goToDetail(hero: heroes[position])
        } else {
            fatalError("REPORT ERROR")
        }
    }

    func getPageForItem(itemIndex: Int) {
        let pageToGet = itemIndex / Constants.resultsForPageLimit // Page limit for request
        if !refreshingData {
            refreshingData = true
            interactor?.getHeroes(page: pageToGet)
        }
    }
}

// MARK: - ListHeroesInteractorOutputContract
extension ListHeroesPresenter: ListHeroesInteractorOutputContract {

}

// MARK: - ListHeroesWireframeOutputContract
extension ListHeroesPresenter: ListHeroesWireframeOutputContract {

}
