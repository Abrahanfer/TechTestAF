//
//  TechTestAFTests.swift
//  TechTestAFTests
//
//  Created by Abrahán Fernández on 6/2/22.
//

import XCTest
@testable import TechTestAF

class ListHeroesViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadView() throws {
        let view = ListHeroesView(nibName: String(describing: ListHeroesView.self), bundle: nil)
        view.loadView()
        XCTAssertNotNil(view.collectionView, "Collection view should not be nil")
    }
}
