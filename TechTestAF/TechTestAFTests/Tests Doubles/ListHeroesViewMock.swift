//
//  ListHeroesViewMock.swift
//  TechTestAFTests
//
//  Created by Abrahán Fernández on 13/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//

import Foundation
@testable import TechTestAF
import XCTest

class ListHeroesViewMock: BaseViewController, ListHeroesViewContract {
    var presenter: ListHeroesPresenterContract?
    var updateListCalled = 0
    var expectation: XCTestExpectation?

    func updateListWithNewElements() {
        updateListCalled += 1
        expectation?.fulfill()
    }
}
