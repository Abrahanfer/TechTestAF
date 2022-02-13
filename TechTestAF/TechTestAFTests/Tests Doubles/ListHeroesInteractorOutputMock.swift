//
//  ListHeroesPresenterMock.swift
//  TechTestAFTests
//
//  Created by Abrahán Fernández on 13/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//

import Foundation
@testable import TechTestAF
import XCTest

class ListHeroesInteractorOutputMock: ListHeroesInteractorOutputContract {
    var updateWithHeroesCalled = 0
    var expectationToFullfil: XCTestExpectation?

    func updateWithHeroes(heroes: [Hero]) {
        updateWithHeroesCalled += 1
        expectationToFullfil?.fulfill()
    }
}
