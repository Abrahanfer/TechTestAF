//
//  ListHeroesInteractor.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 8/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class ListHeroesInteractor: BaseInteractor, ListHeroesInteractorContract {
    weak var output: ListHeroesInteractorOutputContract!

    var provider: HeroesProviderContract

    init (provider: HeroesProviderContract) {
        self.provider = provider
    }
}
