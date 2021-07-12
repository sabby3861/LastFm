//
//  LFReusableIdentifier.swift
//  LastFm
//
//  Created by Sanjay Chauhan on 12/07/2021.
//

import Foundation
/// Protocol to use resuse identifier
protocol LFReusableIdentifier: class {
    static var reuseIdentifier: String { get }
}

extension LFReusableIdentifier {
    static var reuseIdentifier: String {
        return "\(self)"
    }
}

/// Constants to use
let storyboardError = "Couldn't instantiate view controller with identifier"
let activityTitle = "Fetching Planets Info"
let title = "FM Songs"
let genericError = "Something wrong happened, please try later"
let networkError = "Your network seems to be down, please check your connection and try again"
