//
//  ListHeroesPresenterTests.swift
//  TechTestAFTests
//
//  Created by Abrahán Fernández on 13/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//

import XCTest
@testable import TechTestAF

class ListHeroesPresenterTests: XCTestCase {

    var view: ListHeroesViewSpy?
    var interactor: ListHeroesInteractorMock?
    var presenter: ListHeroesPresenter?

    override func setUpWithError() throws {
        view = ListHeroesViewSpy()
        interactor = ListHeroesInteractorMock()
        presenter = ListHeroesPresenter()
        presenter?.view = view
        presenter?.interactor = interactor
        presenter?.interactor?.output = presenter
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadProcessOnPresenter() throws {
        let expectation = XCTestExpectation(description: "Expectation to call view from presenter")
        view?.expectation = expectation
        presenter?.getPageForItem(itemIndex: 0)

        wait(for: [expectation], timeout: 3.0)
        XCTAssert(view?.updateListCalled == 1, "View should be called exactly 1 time")
    }
}
