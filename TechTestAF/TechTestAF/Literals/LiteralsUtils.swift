//
//  LiteralsUtils.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 6/2/22.
//

import Foundation

class LiteralsUtils {
    static func getCharacters() -> [String: AnyObject] {
        if let path = Bundle.main.path(forResource: "page-characters", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [String: AnyObject] {
                    return jsonResult
                }
            } catch {
                fatalError("Error parsing JSON literals from 'page-characters' file")
            }
        }

        fatalError("File 'page-characters' not found in main bundle")
    }
}
