//
//  ListHeroesContract.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 8/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit
import PromiseKit

protocol ListHeroesViewContract: BaseViewController {
    var presenter: ListHeroesPresenterContract! { get set }

}

protocol ListHeroesPresenterContract: BasePresenter {
    var view: ListHeroesViewContract! { get set }
    var interactor: ListHeroesInteractorContract! { get set }
    var wireframe: ListHeroesWireframeContract! { get set }

    func viewWillAppear()
    func viewDidLoad()

}

protocol ListHeroesInteractorContract: BaseInteractor {
    var output: ListHeroesInteractorOutputContract! {get set}
}

protocol ListHeroesInteractorOutputContract: AnyObject {

}

protocol ListHeroesWireframeContract: BaseWireframe {
    var output: ListHeroesWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
}

protocol ListHeroesWireframeOutputContract: AnyObject {

}
