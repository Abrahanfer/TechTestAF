//
//  Comic.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 14/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//

import Foundation
import ObjectMapper

struct Comic: Mappable {
    private var url: String?
    private var name: String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        url <- map["resourceURI"]
        name <- map["name"]
    }

    func getName() -> String {
        return name ?? ""
    }
}
