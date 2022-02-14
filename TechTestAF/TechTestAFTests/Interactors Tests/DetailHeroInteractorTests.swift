//
//  DetailHeroInteractorTests.swift
//  TechTestAFTests
//
//  Created by Abrahán Fernández on 14/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//

import XCTest
@testable import TechTestAF

class DetailHeroInteractorTests: XCTestCase {
    var interactor: DetailHeroInteractor?
    var interactorOutput: DetailHeroInteractorOutputSpy?

    override func setUpWithError() throws {
        // Build interactor with test doubles
        interactor = DetailHeroInteractor(provider: HeroesProviderStub())
        interactorOutput = DetailHeroInteractorOutputSpy()
        interactor?.output = interactorOutput
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCallOutput() throws {
        let expectation = XCTestExpectation(description: "Expectation to call interactor output")
        interactorOutput?.expectationToFullfil = expectation
        let hero = Hero(JSON: ["id": 1,
                               "name": "HeroTest",
                               "description": "Test description"])!
        interactor?.loadDetail(hero: hero)

        wait(for: [expectation], timeout: 3.0)
        XCTAssert(interactorOutput?.updateWithHeroCalled == 1, "Output should be called exactly 1 time")
    }

}
