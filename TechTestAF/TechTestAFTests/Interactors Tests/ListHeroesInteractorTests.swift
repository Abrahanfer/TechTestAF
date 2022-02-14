//
//  ListHeroesInteractorTests.swift
//  TechTestAFTests
//
//  Created by Abrahán Fernández on 13/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//

import XCTest
@testable import TechTestAF

class ListHeroesInteractorTests: XCTestCase {

    var interactor: ListHeroesInteractor?
    var interactorOutput: ListHeroesInteractorOutputSpy?

    override func setUpWithError() throws {
        // Build interactor with test doubles
        interactor = ListHeroesInteractor(provider: HeroesProviderStub())
        interactorOutput = ListHeroesInteractorOutputSpy()
        interactor?.output = interactorOutput
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCallOutput() throws {
        let expectation = XCTestExpectation(description: "Expectation to call interactor output")
        interactorOutput?.expectationToFullfil = expectation
        interactor?.getHeroes(page: 0)

        wait(for: [expectation], timeout: 3.0)
        XCTAssert(interactorOutput?.updateWithHeroesCalled == 1, "Output should be called exactly 1 time")
    }
}
