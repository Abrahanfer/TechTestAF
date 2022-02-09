//
//  DetailHeroContract.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 9/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//
//

import Foundation
import UIKit
import PromiseKit

protocol DetailHeroViewContract: BaseViewController {
    var presenter: DetailHeroPresenterContract? { get set }

}

protocol DetailHeroPresenterContract: BasePresenter {
    var view: DetailHeroViewContract? { get set }
    var interactor: DetailHeroInteractorContract? { get set }
    var wireframe: DetailHeroWireframeContract? { get set }

    func viewWillAppear()
    func viewDidLoad()

}

protocol DetailHeroInteractorContract: BaseInteractor {
    var output: DetailHeroInteractorOutputContract? {get set}
}

protocol DetailHeroInteractorOutputContract: AnyObject {

}

protocol DetailHeroWireframeContract: BaseWireframe {
    var output: DetailHeroWireframeOutputContract? { get set }
    var view: UIViewController! { get set }
}

protocol DetailHeroWireframeOutputContract: AnyObject {

}
