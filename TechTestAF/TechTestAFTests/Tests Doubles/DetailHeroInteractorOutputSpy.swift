//
//  DetailHeroInteractorOutputSpy.swift
//  TechTestAFTests
//
//  Created by Abrahán Fernández on 14/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//

import Foundation
@testable import TechTestAF
import XCTest

class DetailHeroInteractorOutputSpy: DetailHeroInteractorOutputContract {
    var updateWithHeroCalled = 0
    var expectationToFullfil: XCTestExpectation?

    func updateHeroInfo(hero: Hero) {
        updateWithHeroCalled += 1
        expectationToFullfil?.fulfill()
    }
}
