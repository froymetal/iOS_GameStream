//
//  Model.swift
//  GameStream
//
//  Created by Froy on 8/19/21.
// Fuente
// https://gamestream-api.herokuapp.com/api-docs/

import Foundation

//Para guardar los resultados de las busquedas
struct Resultados: Codable{
    var results: [Game]
}
//Para guardar todos los juegos
struct Games: Codable{
    var games: [Game]
}

struct Game: Codable, Hashable {
    var title: String
    var studio: String
    var contentRaiting: String
    var publicationYear: String
    var description: String
    var platforms: [String]
    var tags: [String]
    var videosUrls: videoUrl
    var galleryImages: [String]
}

struct videoUrl: Codable, Hashable{
    var mobile: String
    var tablet: String
}


