//
//  LFAlbumTableViewCell.swift
//  LastFm
//
//  Created by Sanjay Chauhan on 12/07/2021.
//

import UIKit

class LFAlbumTableViewCell: UITableViewCell {
    
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    /// Display data on table view cell
    ///
    /// - Parameter data: Results containing all info
    func displayData(album: LFResponse) {
        if let title = album.title {
            albumNameLabel.text = title
        } else {
            albumNameLabel.text = noAlbum
        }
        if let name = album.name {
            artistNameLabel.text = name
        } else {
            artistNameLabel.text = noArtist
        }
    }
}


