//
//  ListHeroesWireframe.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 8/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit

class ListHeroesWireframe: BaseWireframe, ListHeroesWireframeContract {
    weak var output: ListHeroesWireframeOutputContract?
    weak var view: UIViewController!

    func goToDetail(hero: Hero) {
        let destinyView = DetailHeroBuilder.build(hero: hero)
        assert(view.navigationController != nil, "Navigation Controller should not be nil")
        view.navigationController?.pushViewController(destinyView, animated: true)
    }

    
}
