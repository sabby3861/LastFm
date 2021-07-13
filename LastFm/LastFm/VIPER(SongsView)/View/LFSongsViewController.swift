//
//  LFSongsViewController..swift
//  LastFm
//
//  Created by Sanjay Chauhan on 12/07/2021.
//

import UIKit

class LFSongsViewController: UIViewController, PayLoadFormat, LFSongsViewProtocol {
    /// Presenter protocol
    var presenter: LFSongsPresenterProtocol?
    /// Lazy property for activity indicator
    internal lazy var activity = LFActivityView()
    var type: LFQueryType = .album
    /// Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }


}


// MARK: - Extension for TableView DataSource
extension LFSongsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = presenter?.response else { return 0 }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LFAlbumTableViewCell.reuseIdentifier, for: indexPath) as? LFAlbumTableViewCell else {
            fatalError("cellError")
        }
        if let albumInfo = presenter?.response?[indexPath.row] {
            cell.displayData(album: albumInfo)
        }
        return cell
    }
}


extension LFSongsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.storyboard(storyboard: .Main)
        let view: LFDetailViewController = storyboard.instantiateVieController()
        guard let result = presenter?.response?[indexPath.row] else { return  }
        //view.result = result
        LFDetailRouter().assembleModule(response: result, view: view)
        self.navigationController?.pushViewController(view, animated: true)
    }
}



/***
 Searh Bar Delegate Methods
*/
extension LFSongsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            type = .album
        case 1:
            type = .song
        default:
            type = .artist
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = false
            searchBar.text = ""
            searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let text = searchBar.text, text.count < 15  else {
            return LFAlertViewController.showAlert(withTitle: alertTitle, message: searchError)
        }
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        activity.showActivityIndicatory(view: self.view, alertTitle)
        ///Make sure to escape string, in csse of empty space we need to escape the string to let it work
        guard let escapedString = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        presenter?.fetchAlbumsInformation(searchText: escapedString,type: self.type)
    }
}
