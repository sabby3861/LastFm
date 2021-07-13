//
//  LFPayload.swift
//  LastFm
//
//  Created by Sanjay Chauhan on 12/07/2021.
//

import Foundation
protocol PayLoadFormat {
    func formatGetPayload(url: LFHTTPUrl, module: LFAPIModule) -> LFHTTPPayloadProtocol
}
extension PayLoadFormat{
    func formatGetPayload(url: LFHTTPUrl, module: LFAPIModule) -> LFHTTPPayloadProtocol{
        var payload = LFHTTPPayload(url: url,payload: module)
        payload.headers = Dictionary<String, String>()
        payload.addHeader(name: LFHTTPHeaderType.contentType.rawValue, value: LFHTTPMimeType.applicationJSON.rawValue)
        return payload
    }
}

protocol LFHTTPPayloadProtocol {
    var type: LFHTTPPayloadType? { get }
    var headers: Dictionary<String, String>? { get set }
    var url: URL? {get}
}
/// Payload
struct LFHTTPPayload: LFHTTPPayloadProtocol {
    var type: LFHTTPPayloadType?
    var headers: Dictionary<String, String>?
    var url: URL?
    let apiKey = "aa8e1202264ab46b248d9583c0cda190"
    fileprivate init(url: LFHTTPUrl, payload: LFAPIModule) {
        self.type = payload.payloadType
        var components = URLComponents()
            components.scheme = "https"
            components.host = url.rawValue
            components.path = "/2.0"
            components.queryItems = [
                URLQueryItem(name: "method", value: payload.searchType.getSearchType()),
                URLQueryItem(name: payload.searchType.getType(), value: payload.searchText),
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "format", value: "json")
            ]
        self.url = components.url
    }
    fileprivate mutating func addHeader(name: String, value: String) {
        headers?[name] = value
    }
}

enum LFHTTPMimeType: String {
    case applicationJSON = "application/json; charset=utf-8"
}
enum LFHTTPHeaderType: String{
    case contentType    = "Content-Type"
}

enum LFHTTPMethod: String {
    case get
    case put
}

enum LFHTTPPayloadType{
    case requestMethodGET
    case requestMethodPUT
    func httpMethod() -> String {
        switch self{
        case .requestMethodGET: return LFHTTPMethod.get.rawValue
        case .requestMethodPUT: return LFHTTPMethod.put.rawValue
        }
    }
    
}

enum LFHTTPUrl: String {
    //case albumsUrl = "https://ws.audioscrobbler.com/2.0/?method=album.search&album=yourlove&api_key=aa8e1202264ab46b248d9583c0cda190&format=json"
    case albumsUrl = "ws.audioscrobbler.com"
}
/*
 API key    aa8e1202264ab46b248d9583c0cda190
 Shared secret    04d16e590fd03fc64f107c82b8ba59e7
 */


struct LFAPIModule {
    var searchType: LFQueryType = .album
    var payloadType: LFHTTPPayloadType?
    var searchText = ""
    
}



enum LFQueryType: String {
  case album = "album"
  case song = "track"
  case artist = "artist"
    
    func getType() -> String {
        switch self{
        case .album: return LFQueryType.album.rawValue
        case .song: return LFQueryType.song.rawValue
        case .artist: return LFQueryType.artist.rawValue
        }
    }
    
    func getSearchType() -> String {
        switch self{
        case .album: return LFSearchType.album.rawValue
        case .song: return LFSearchType.song.rawValue
        case .artist: return LFSearchType.artist.rawValue
        }
    }
}


enum LFSearchType: String {
  case album = "album.search"
  case song = "track.search"
  case artist = "artist.search"
}
