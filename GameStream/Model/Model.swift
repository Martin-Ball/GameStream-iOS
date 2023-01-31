//
//  Model.swift
//  GameStream
//
//  Created by Martin Ballester on 31/01/2023.
//

import Foundation

struct Games : Codable {
    var games : [Game]?
}

struct Game : Codable {
    var title : String?
    var studio : String?
    var contentRaiting : String?
    var publicationYear : String?
    var description : String?
    var platforms : [String]?
    var tags : [String]?
    var videosUrls : videoUrl
    var galleryImages : [String]?
}

struct videoUrl : Codable {
    var mobile : String?
    var tablet : String?
}
