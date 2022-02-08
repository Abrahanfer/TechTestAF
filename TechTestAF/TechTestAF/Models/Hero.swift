//
//  Heroe.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 6/2/22.
//

import Foundation
import ObjectMapper

struct Hero: Mappable {
    var identifier: UInt64?
    var name: String?
    var description: String?
    var thumbnail: String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        identifier <- map["id"]
        name <- map["name"]
        description <- map["description"]
        thumbnail <- map["thumbnail.path"]
    }
}
