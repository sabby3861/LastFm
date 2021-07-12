//
//  LFSongsViewController..swift
//  LastFm
//
//  Created by Sanjay Chauhan on 12/07/2021.
//

import UIKit

class LFSongsViewController: UIViewController, PayLoadFormat {

    internal lazy var activity = LFActivityView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.activity.showActivityIndicatory(view: self.view, activityTitle)
        
        let payload = formatGetPayload(url: .albumsUrl, type: .requestMethodGET)
        let api = APIManager()
        api.getAlbumsInfo(payload: payload) { [unowned self]result in
            switch result {
            case .success(_):
                print("Response is \(result)")
                
            case .failure(let error):
                print("Response is")
            }

        }
    }


}

