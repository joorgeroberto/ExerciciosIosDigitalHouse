//
//  EpisodesListViewController.swift
//  1113_TvMazeApi
//
//  Created by Jorge Roberto on 13/11/20.
//

import UIKit
import Alamofire

class EpisodesListViewController: UIViewController {
    var show: Show?
    var season: Season?
    var arrayEpisodes = [Episode]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var showImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = season!.name
        if let apiShow = show,
           let url = URL(string: apiShow.image.medium) {
            showImage.kf.setImage(with: url)
        }
        tableView.delegate = self
        tableView.dataSource = self
        loadEpisodes()
    }
    func saveEpisodes(arrayEpisodes: [Episode]) {
        self.arrayEpisodes = arrayEpisodes
        tableView.reloadData()
    }
    
    func loadEpisodes() {
        if let apiSeason = self.season {
            AF.request("http://api.tvmaze.com/seasons/\(apiSeason.id!)/episodes").responseJSON  { response in
                //print(response)
                if let arrayDictionary = response.value as? [[String: Any]] {
                    var arrayEpisodes = [Episode]()
                    for dictionary in arrayDictionary {
                        let loadedData = Episode(fromDictionary: dictionary)
                        arrayEpisodes.append(loadedData)
                    }
                    //print(arraySeasons)
                    DispatchQueue.main.async {
                        self.saveEpisodes(arrayEpisodes: arrayEpisodes)
                    }
                }
            }
        }
    }
}

extension EpisodesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension EpisodesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell") as! EpisodeTableViewCell
        cell.setup(episode: arrayEpisodes[indexPath.row])
        return cell
    }
    
    
}
