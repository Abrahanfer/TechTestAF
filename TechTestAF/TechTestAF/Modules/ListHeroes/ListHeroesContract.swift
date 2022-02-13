//
//  ListHeroesContract.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 8/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//
//

import Foundation
import UIKit
import PromiseKit

protocol ListHeroesViewContract: BaseViewController {
    var presenter: ListHeroesPresenterContract? { get set }

    func updateListWithNewElements()
}

protocol ListHeroesPresenterContract: BasePresenter {
    var view: ListHeroesViewContract? { get set }
    var interactor: ListHeroesInteractorContract? { get set }
    var wireframe: ListHeroesWireframeContract? { get set }

    func viewWillAppear()
    func viewDidLoad()
    func getHeroesCount() -> Int
    func getHeroAtPosition(position: Int) -> Hero
    func selectItem(position: Int)
    func getPageForItem(itemIndex: Int)
}

protocol ListHeroesInteractorContract: BaseInteractor {
    var output: ListHeroesInteractorOutputContract? {get set}

    func getHeroes(page: Int)
}

protocol ListHeroesInteractorOutputContract: AnyObject {
    func updateWithHeroes(heroes: [Hero])
}

protocol ListHeroesWireframeContract: BaseWireframe {
    var output: ListHeroesWireframeOutputContract? { get set }
    var view: UIViewController! { get set }

    func goToDetail(hero: Hero)
}

protocol ListHeroesWireframeOutputContract: AnyObject {

}
