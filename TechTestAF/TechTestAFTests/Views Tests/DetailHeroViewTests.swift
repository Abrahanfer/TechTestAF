//
//  DetailHeroViewTests.swift
//  TechTestAFTests
//
//  Created by Abrahán Fernández on 13/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//

import XCTest
@testable import TechTestAF

class DetailHeroViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadView() throws {
        let view = DetailHeroView(nibName: String(describing: DetailHeroView.self), bundle: nil)
        view.loadView()
        XCTAssertNotNil(view.heroImage, "Hero Image view should not be nil")
        XCTAssertNotNil(view.heroName, "Hero name label should not be nil")
        XCTAssertNotNil(view.heroDescription, "Hero description label should not be nil")
    }
}
