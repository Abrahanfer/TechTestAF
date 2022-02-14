//
//  DetailHeroInteractor.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 9/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//
//

import Foundation

class DetailHeroInteractor: BaseInteractor, DetailHeroInteractorContract {
    weak var output: DetailHeroInteractorOutputContract?
    var provider: HeroesProviderContract

    init(provider: HeroesProviderContract) {
        self.provider = provider
    }

    func loadDetail(hero: Hero) {
        provider.getHeroDetail(hero: hero).done { heroDetail in
            self.output?.updateHeroInfo(hero: heroDetail)
        }.catch { _ in
            self.output?.showErrorFeedback(error: .failToGetData)
        }
    }
}
