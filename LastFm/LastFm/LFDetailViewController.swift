//
//  LFDetailViewController.swift
//  LastFm
//
//  Created by Sanjay Chauhan on 13/07/2021.
//

import UIKit

class LFDetailViewController: UIViewController, LFDetailViewProtocol {
    var response: LFResponse?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = response?.title
        nameLabel.text = response?.name
        // Do any additional setup after loading the view.
        guard let imageUrl = URL(string: (response?.image?.first!.url)!) else { return }
        imageView.load(url: imageUrl)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


