//
//  HeroModelTests.swift
//  TechTestAFTests
//
//  Created by Abrahán Fernández on 14/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//

import XCTest
import PromiseKit
@testable import TechTestAF

class HeroModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModelingFromJSON() throws {
        let expectation = XCTestExpectation(description: "Expectation to wait for data from provider")
        let provider = HeroesProviderStub()
        provider.getHeroes(page: 0).done { heroes in
            let hero = heroes[0]
            XCTAssertEqual(hero.getName(), "3-D Man", "Name wrong")
            XCTAssertEqual(hero.getComics().count, 12, "Error parsing comics")
            expectation.fulfill()
        }.catch { _ in
            XCTFail("Error retrieving data from Stub")
        }

        wait(for: [expectation], timeout: 2.0)
    }

}
