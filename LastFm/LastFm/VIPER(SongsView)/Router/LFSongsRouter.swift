//
//  LFSongsRouter.swift
//  LastFm
//
//  Created by Sanjay Chauhan on 12/07/2021.
//

import Foundation

final class LFSongsRouter: LFSongsRouterProtocol {
    var presenter: LFSongsPresenterProtocol?
    
    /// Assemble the VIPER modules here
     func assembleModule(view: LFSongsViewProtocol) {
        let presenter = LFSongsPresenter()
        let interactor = LFSongsInteractor()
        let router = LFSongsRouter()
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
        view.presenter = presenter
        router.presenter = presenter
    }
    
    
}
