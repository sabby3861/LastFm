//
//  LFSongsViewController..swift
//  LastFm
//
//  Created by Sanjay Chauhan on 12/07/2021.
//

import UIKit

class LFSongsViewController: UIViewController {

    internal lazy var activity = LFActivityView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.activity.showActivityIndicatory(view: self.view, activityTitle)
    }


}

