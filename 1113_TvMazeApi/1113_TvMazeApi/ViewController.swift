//
//  ViewController.swift
//  1113_TvMazeApi
//
//  Created by Jorge Roberto on 13/11/20.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrayShows = [Show]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        loadShows()
    }

    func saveShows(arrayShows: [Show]) {
        self.arrayShows = arrayShows
        tableView.reloadData()
    }
    
    func loadShows() {
        AF.request("https://api.tvmaze.com/shows?page=1").responseJSON  { response in
            if let arrayDictionary = response.value as? [[String: Any]] {
                var arrayShows = [Show]()
                for dictionary in arrayDictionary {
                    let loadedData = Show(fromDictionary: dictionary)
                    arrayShows.append(loadedData)
                }
                DispatchQueue.main.async {
                    self.saveShows(arrayShows: arrayShows)
                }
            }
        }
    }
    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let showDetails = UIStoryboard(name: "ShowDetails", bundle: nil).instantiateInitialViewController() as? ShowDetailsController {
            showDetails.show = arrayShows[indexPath.row]
            navigationController?.pushViewController(showDetails, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayShows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCell") as! ShowTableViewCell
        cell.setup(show: arrayShows[indexPath.row])
        return cell
    }
    
    
}
