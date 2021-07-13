//
//  LFSongsViewProtocols.swift
//  LastFm
//
//  Created by Sanjay Chauhan on 12/07/2021.
//

import Foundation

import UIKit

/// View Protocol
protocol LFSongsViewProtocol: AnyObject
{
    var presenter: LFSongsPresenterProtocol? { get set}
    var tableView: UITableView!{get set}
    var activity: LFActivityView {get set}
}

/// View -> Interactor and View -> Router Communication Protocols
protocol LFSongsPresenterProtocol: AnyObject
{
    var view: LFSongsViewProtocol? { get }
    var interactor: LFSongsInteractorProtocol?{get}
    var response: [LFResponse]? {get}
    func fetchAlbumsInformation(searchText: String, type: LFQueryType)
}

/// Interactor -> Presenter Communication Protocols
protocol LFSongsInteractorProtocol: AnyObject
{
    var output: LFSongsOutputProtocol? { get }
    func decodeJSONInformation(searchText: String, searchType: LFQueryType)
}

/// Interactor to Presenter Output Protocol
protocol LFSongsOutputProtocol: AnyObject
{
    func albumsInfoDidFetch(albums: [LFAlbums])
    func artistInfoDidFetch(artists: [LFArtist])
    func songsInfoDidFetch(tracks: [LFTracks])
    func errorOccured(message: String)
}

/// Router Protocols and assembling Module
protocol LFSongsRouterProtocol: AnyObject
{
    var presenter: LFSongsPresenterProtocol? {get set}
    func assembleModule(view: LFSongsViewProtocol)
}

/// APIManager Protocol
/*
protocol APIManagerProtocol {
    func getPlanetsInfo(payload: JPHTTPPayloadProtocol,completion: @escaping (Result<LFAlbumsResult, Error>) -> Void)
}
*/
