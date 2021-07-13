//
//  LFArtists.swift
//  LastFm
//
//  Created by Sanjay Chauhan on 13/07/2021.
//

import Foundation
struct LFArtistResponse: Codable{
    let result : LFArtisResults
    
    enum CodingKeys: String, CodingKey {
        case result = "results"
    }
}

struct LFArtisResults: Codable {
    var artistMatches: LFArtisMatches
   
    enum CodingKeys: String, CodingKey {
        case artistMatches = "artistmatches"
    }
}

struct LFArtisMatches: Codable {
    let matches : [LFArtist]?
    
    enum CodingKeys: String, CodingKey {
        case matches = "artist"
    }
}

struct LFArtist: Codable {
     let title: String
     let name: String
     let image: [LFImage]
    
    enum CodingKeys: String, CodingKey {
        case title = "name"
        case name = "url"
        case image = "image"
    }
}




