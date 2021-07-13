//
//  LFSongs.swift
//  LastFm
//
//  Created by Sanjay Chauhan on 13/07/2021.
//

import Foundation
struct LFSongResponse: Codable{
    let songs : LFTrackResults
    
    enum CodingKeys: String, CodingKey {
        case songs = "results"
    }
}

struct LFTrackResults: Codable {
    var trackMatches: LFTrackMatches
   
    enum CodingKeys: String, CodingKey {
        case trackMatches = "trackmatches"
    }
}

struct LFTrackMatches: Codable {
    let matches : [LFTracks]?
    
    enum CodingKeys: String, CodingKey {
        case matches = "track"
    }
}

struct LFTracks: Codable {
     let title: String
     let name: String
     let image: [LFImage]
    
    enum CodingKeys: String, CodingKey {
        case title = "name"
        case name = "artist"
        case image = "image"
    }
}

struct LFTrackImage: Codable{
    let url: String
    let size: String
    
    enum CodingKeys: String, CodingKey{
        case url = "#text"
        case size
    }
}
