//
//  LFAlbums.swift
//  LastFm
//
//  Created by Sanjay Chauhan on 12/07/2021.
//

import Foundation

struct LFAlbumResponse: Codable{
    let albums : LFAlbumsResult
    
    enum CodingKeys: String, CodingKey {
        case albums = "results"
    }
}

struct LFAlbumsResult: Codable {
    var albumMatches: LFAlbumInfo
    
    enum CodingKeys: String, CodingKey {
        case albumMatches = "albummatches"
    }
}

struct LFAlbumInfo: Codable {
    var album: [LFAlbums]?
    
    enum CodingKeys: String, CodingKey {
        case album = "album"
    }
}

struct LFAlbums: Codable {
    let title: String
    let name: String
    let image: [LFImage]
    
    enum CodingKeys: String, CodingKey {
        case title = "name"
        case name = "artist"
        case image = "image"
    }
}

struct LFImage: Codable{
    let url: String
    let size: String
    
    enum CodingKeys: String, CodingKey{
        case url = "#text"
        case size
    }
}

protocol LFResponseProtocol {
    var title: String? {get set}
    var name: String? {get set}
    var image: [LFImage]? {get set}
}
struct LFResponse: LFResponseProtocol {
    var title: String?
    var name: String?
    var image: [LFImage]?
    
}
