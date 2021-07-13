//
//  LFDetailProtocols.swift
//  LastFm
//
//  Created by Sanjay Chauhan on 13/07/2021.
//

import Foundation

/// View Protocol
protocol LFDetailViewProtocol: AnyObject
{
    var response: LFResponse? { get set}
}

/// Router Protocols and assembling Module
protocol LFDetailRouterProtocol: AnyObject
{
    func assembleModule(response: LFResponseProtocol, view: LFDetailViewProtocol)
}
