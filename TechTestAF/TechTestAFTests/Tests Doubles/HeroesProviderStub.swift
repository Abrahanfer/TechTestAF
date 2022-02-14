//
//  HeroesProviderMock.swift
//  TechTestAFTests
//
//  Created by Abrahán Fernández on 13/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//

import Foundation
import PromiseKit
@testable import TechTestAF

class HeroesProviderStub: HeroesProviderContract {
    func getHeroes(page: Int) -> Promise<[Hero]> {
        return Promise<[Hero]> { promise in
            let data = LiteralsUtils.getCharacters()
            if let dataJSON = data["data"] as? [String: AnyObject],
               let elements = dataJSON["results"] as? [[String: AnyObject]] {
                // Parse objects
                var characters: [Hero] = []
                elements.forEach { element in
                    if let character = Hero(JSON: element) {
                        characters.append(character)
                    }
                }
                promise.fulfill(characters)
            }
        }
    }

    func getHeroDetail(hero: Hero) -> Promise<Hero> {
        return Promise<Hero> { promise in
            let data = LiteralsUtils.getCharacters()
            if let dataJSON = data["data"] as? [String: AnyObject],
               let elements = dataJSON["results"] as? [[String: AnyObject]] {
                let hero = Hero(JSON: elements[0])!
                promise.fulfill(hero)
            }
        }
    }
}
