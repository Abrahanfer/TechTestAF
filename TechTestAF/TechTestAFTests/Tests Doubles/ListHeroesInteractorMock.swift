//
//  ListHeroesInteractorMock.swift
//  TechTestAFTests
//
//  Created by Abrahán Fernández on 13/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//

import Foundation
@testable import TechTestAF

class ListHeroesInteractorMock: BaseInteractor, ListHeroesInteractorContract {
    var output: ListHeroesInteractorOutputContract?

    func getHeroes(page: Int) {
        output?.updateWithHeroes(heroes: [])
    }
}
