//
//  Constants.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 6/2/22.
//

import Foundation

struct Constants {
    private static let infoDictionay: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("NO INFO PLIST")
        }

        return dict
    }()

    // Api Keys
    static let apiKeyPrivate: String = {
        guard let keyPrivate = infoDictionay["API_KEY_PRIVATE"] as? String else {
            fatalError("NO API PRIVATE KEY")
        }
        return keyPrivate
    }()
    
    static let apiKeyPublic: String = {
        guard let keyPublic = infoDictionay["API_KEY_PUBLIC"] as? String else {
            fatalError("NO API PUBLIC KEY")
        }
        return keyPublic
    }()
    // Host
    static let host = "https://gateway.marvel.com"
}
