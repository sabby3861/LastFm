//
//  LFSongsPresenter.swift
//  LastFm
//
//  Created by Sanjay Chauhan on 12/07/2021.
//

import Foundation

class LFSongsPresenter: LFSongsPresenterProtocol {
    var view: LFSongsViewProtocol?
    
    var interactor: LFSongsInteractorProtocol?
    
    var response: [LFResponse]?
    
    func fetchAlbumsInformation(searchText: String, type: LFQueryType) {
        interactor?.decodeJSONInformation(searchText: searchText, searchType: type)
    }
    
    
}


// MARK: - Presenter to view communcation
extension LFSongsPresenter: LFSongsOutputProtocol {
    func albumsInfoDidFetch(albums: [LFAlbums]) {
        self.response = [LFResponse]()
        _ = albums.map {
            let response = LFResponse(title: $0.title, name: $0.name, image: $0.image)
            self.response?.append(response)
        }
        reloadData()
    }
    
    func songsInfoDidFetch(tracks: [LFTracks]) {
        self.response = [LFResponse]()
        _ = tracks.map {
            let response = LFResponse(title: $0.title, name: $0.name, image: $0.image)
            self.response?.append(response)
        }
        reloadData()
    }
    
    func artistInfoDidFetch(artists: [LFArtist]) {
        self.response = [LFResponse]()
        _ = artists.map {
            let response = LFResponse(title: $0.title, name: $0.name, image: $0.image)
            self.response?.append(response)
        }
        reloadData()
    }
    func errorOccured(message: String) {
        LFAlertViewController.showAlert(withTitle: alertTitle, message: message)
        view?.activity.removeActivity()
    }
    
    func reloadData()  {
        view?.tableView.reloadData()
        view?.activity.removeActivity()
    }
    /// Function to get the Reesponse
 
}



