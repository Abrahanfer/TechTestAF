//
//  Heroe.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 6/2/22.
//

import Foundation
import ObjectMapper

struct Hero: Mappable {
    enum HeroImageSize: String {
        case portraitSmall = "portrait_small"
        case portraitXLarge = "portrait_xlarge"
        case standardMedium = "standard_medium"
        case landscapeIncredible = "landscape_incredible"
    }

    var identifier: UInt64?
    var name: String?
    var description: String?
    private var thumbnailPath: String?
    private var thumbnailExtension: String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        identifier <- map["id"]
        name <- map["name"]
        description <- map["description"]
        thumbnailPath <- map["thumbnail.path"]
        thumbnailExtension <- map["thumbnail.extension"]
    }

    func getThumbnailStringFor(size: HeroImageSize) -> String {
        guard let path = thumbnailPath, let type = thumbnailExtension else {
            return ""
        }
        return "\(path)/\(size.rawValue).\(type)"
    }
}
