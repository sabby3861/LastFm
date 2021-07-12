//
//  LFPayload.swift
//  LastFm
//
//  Created by Sanjay Chauhan on 12/07/2021.
//

import Foundation
protocol PayLoadFormat {
    func formatGetPayload(url: JPHTTPUrl, type: LFHTTPPayloadType) -> LFHTTPPayloadProtocol
}
extension PayLoadFormat{
    func formatGetPayload(url: JPHTTPUrl, type: LFHTTPPayloadType) -> LFHTTPPayloadProtocol{
        var payload = LFHTTPPayload(url: url,payloadType: type)
        payload.headers = Dictionary<String, String>()
        payload.addHeader(name: LFHTTPHeaderType.contentType.rawValue, value: LFHTTPMimeType.applicationJSON.rawValue)
        return payload
    }
}

protocol LFHTTPPayloadProtocol {
    var type: LFHTTPPayloadType? { get }
    var headers: Dictionary<String, String>? { get set }
    var url: String {get}
}
/// Payload
struct LFHTTPPayload: LFHTTPPayloadProtocol {
    var type: LFHTTPPayloadType?
    var headers: Dictionary<String, String>?
    var url: String
    
    fileprivate init(url: JPHTTPUrl, payloadType: LFHTTPPayloadType) {
        self.type = payloadType
        self.url = url.rawValue
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

enum JPHTTPUrl: String {
    case albumsUrl = "https://ws.audioscrobbler.com/2.0/?method=album.search&album=yourlove&api_key=aa8e1202264ab46b248d9583c0cda190&format=json"
    //case albumsUrl = "https://ws.audioscrobbler.com/2.0/?method=track.search&track=hero&api_key=d527fc1829aecc7e54b63367b3d4621a&format=json"
}
/*
 API key    aa8e1202264ab46b248d9583c0cda190
 Shared secret    04d16e590fd03fc64f107c82b8ba59e7
 */
