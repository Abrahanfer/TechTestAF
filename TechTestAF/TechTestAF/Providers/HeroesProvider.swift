//
//  HeroesProvider.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 6/2/22.
//

import Foundation
import PromiseKit
import CryptoKit

protocol HeroesProviderContract {
    func getHeroes(page: Int) -> Promise<[Hero]>
    func getHeoreDetail() -> Promise<HeroDetail>
}

class HeroesProvider: HeroesProviderContract {

    enum HeroesProviderError: Error {
        case errorRetreivingHeroesPage
        case errorParsingHeroesPage
        case errorRetreivingHeroDetailPage
    }

    private let offsetPage = 20
    private var session: URLSession!

    init() {
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }

    func getHeroes(page: Int = 0) -> Promise<[Hero]> {
        return Promise<[Hero]> { promise in
            // Make url with params for request
            let timestamp = "\(Date().timeIntervalSince1970)"
            let requestOffset = page * offsetPage
            let md5Hash = getRequestHash(timestamp: timestamp)

            let pathStringPart1 = "\(Constants.host)/v1/public/characters?ts=\(timestamp)&apikey=\(Constants.apiKeyPublic)&"
            let pathStringPart2 = "hash=\(md5Hash)&offset=\(requestOffset)"
            let pathString = pathStringPart1 + pathStringPart2

            let urlRequest = URLRequest(url: URL(string: pathString)!)
            let dataTask = session.dataTask(with: urlRequest, completionHandler: { data, _, error in
                guard let data = data else {
                    promise.reject(HeroesProviderError.errorRetreivingHeroesPage)
                    return
                }

                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    if let jsonResult = jsonResult as? [String: AnyObject],
                       let dataJSON = jsonResult["data"] as? [String: AnyObject],
                       let elements = dataJSON["results"] as? [[String: AnyObject]] {
                        // Parse objects
                        var characters: [Hero] = []
                        elements.forEach { element in
                            if let character = Hero(JSON: element) {
                                characters.append(character)
                            }
                        }
                        promise.fulfill(characters)
                    } else {
                        promise.reject(HeroesProviderError.errorParsingHeroesPage)
                    }
                } catch {
                    promise.reject(error)
                }
            })

            dataTask.resume()

        }
    }

    func getHeoreDetail() -> Promise<HeroDetail> {
        fatalError("TO IMPLEMENT")
    }

    // MARK: - Private functions
    private func getRequestHash(timestamp: String) -> String {
        let stringToHash = "\(timestamp)\(Constants.apiKeyPrivate)\(Constants.apiKeyPublic)"
        guard let dataToHash = stringToHash.data(using: .utf8) else {
            fatalError("TO IMPLEMENT ERROR CONTROL")
        }
        return Insecure.MD5.hash(data: dataToHash).map { String(format: "%02x", $0) }.joined()
    }
}