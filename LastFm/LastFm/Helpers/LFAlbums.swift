//
//  LFAlbums.swift
//  LastFm
//
//  Created by Sanjay Chauhan on 12/07/2021.
//

import Foundation
/*
struct LFAlbumResponse: Codable{
    let albums : LFAlbumInfo
    
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
        case album
    }
    /*
    // MARK: - Decodable
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.album = try container.decodeIfPresent([LFAlbums].self, forKey: .album)
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(album, forKey: .album)
    }*/
    
}
 struct LFAlbums: Codable {
    var artist: String
    var name: String
    var mbid: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case artist
        case name
        case mbid
        case url
    }

/*
    // MARK: - Decodable
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.artist = try container.decodeIfPresent(String.self, forKey: .artist) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.mbid = try container.decodeIfPresent(String.self, forKey: .mbid)
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(artist, forKey: .artist)
        try container.encode(name, forKey: .name)
        try container.encode(mbid, forKey: .mbid)
        try container.encode(url, forKey: .url)
    }
  */
    
}
*/



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
     let albumName: String
     let artistName: String
     let albumImage: [LFAlbumImage]
    
    enum CodingKeys: String, CodingKey {
        case albumName = "name"
        case artistName = "artist"
        case albumImage = "image"
    }
}

struct LFAlbumImage: Codable{
    let url: String
    let size: String
    
    enum CodingKeys: String, CodingKey{
        case url = "#text"
        case size
    }
}

