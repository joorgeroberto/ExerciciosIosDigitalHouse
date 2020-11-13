//
//  ShowDetailsController.swift
//  1113_TvMazeApi
//
//  Created by Jorge Roberto on 13/11/20.
//

import UIKit
import Kingfisher
import Alamofire

class ShowDetailsController: UIViewController {
    var show: Show?
    var arraySeasons = [Season]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var showImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let apiShow = show,
           let url = URL(string: apiShow.image.medium) {
            showImage.kf.setImage(with: url)
            self.title = apiShow.name
            genderLabel.text =  apiShow.genres.joined(separator: ", ")
            if let rating = apiShow.rating.average {
                ratingLabel.text = "\(rating) ⭐️"
            }
        }
        tableView.delegate = self
        tableView.dataSource = self
        loadSeasons()
    }
    
    func saveSeasons(arraySeasons: [Season]) {
        self.arraySeasons = arraySeasons
        tableView.reloadData()
    }
    
    func loadSeasons() {
        if let apiShow = self.show {
            AF.request("http://api.tvmaze.com/shows/\(apiShow.id!)/seasons").responseJSON  { response in
                //print(response)
                if let arrayDictionary = response.value as? [[String: Any]] {
                    var arraySeasons = [Season]()
                    for dictionary in arrayDictionary {
                        let loadedData = Season(fromDictionary: dictionary)
                        arraySeasons.append(loadedData)
                    }
                    //print(arraySeasons)
                    DispatchQueue.main.async {
                        self.saveSeasons(arraySeasons: arraySeasons)
                    }
                }
            }
        }
    }
}

extension ShowDetailsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let episodesList = UIStoryboard(name: "EpisodesList", bundle: nil).instantiateInitialViewController() as? EpisodesListViewController {
            episodesList.show = show
            episodesList.season = arraySeasons[indexPath.row]
            episodesList.showImage = showImage
            navigationController?.pushViewController(episodesList, animated: true)
            
        }
    }
}

extension ShowDetailsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraySeasons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeasonCell") as! SeasonTableViewCell
        cell.setup(season: arraySeasons[indexPath.row])
        return cell
    }
    
    
}
