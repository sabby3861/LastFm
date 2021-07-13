//
//  LFDetailRouter.swift
//  LastFm
//
//  Created by Sanjay Chauhan on 13/07/2021.
//

import Foundation

class LFDetailRouter: LFDetailRouterProtocol {
    func assembleModule(response: LFResponseProtocol, view: LFDetailViewProtocol) {
        view.response = response as? LFResponse
    }
}
