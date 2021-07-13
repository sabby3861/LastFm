//
//  LFSongsInteractor.swift
//  LastFm
//
//  Created by Sanjay Chauhan on 12/07/2021.
//

import Foundation

class LFSongsInteractor: LFSongsInteractorProtocol, PayLoadFormat {
    var output: LFSongsOutputProtocol?
    
    func decodeJSONInformation(searchText: String, searchType: LFQueryType) {
        var apiModule = LFAPIModule()
        apiModule.payloadType = LFHTTPPayloadType.requestMethodGET
        apiModule.searchType = searchType
        apiModule.searchText = searchText
        let payload = formatGetPayload(url: .albumsUrl, module: apiModule)
        let api = APIManager()
  
        switch apiModule.searchType {
        case .album:
            api.getAlbumsInfo(payload: payload) { [unowned self] result in
                switch result {
                case .success(let data):
                    guard let albums = data.albums.albumMatches.album else { return  }
                    self.output?.albumsInfoDidFetch(albums: albums)
                case .failure(let error):
                    self.output?.errorOccured(message: error.localizedDescription)
                }

            }
        case .artist:
            api.getArtistInfo(payload: payload) { [unowned self] result in
                switch result {
                case .success(let data):
                    guard let artists = data.result.artistMatches.matches else { return  }
                    self.output?.artistInfoDidFetch(artists: artists)
                case .failure(let error):
                    self.output?.errorOccured(message: error.localizedDescription)
                }

            }
        case .song:
            api.getSongsInfo(payload: payload) { [unowned self] result in
                switch result {
                case .success(let data):
                    guard let tracks = data.songs.trackMatches.matches else { return  }
                    self.output?.songsInfoDidFetch(tracks: tracks)
                case .failure(let error):
                    self.output?.errorOccured(message: error.localizedDescription)
                }

            }
        }
    }
    
    
}



