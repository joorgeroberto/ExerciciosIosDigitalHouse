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
    @IBOutlet weak var showImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let apiShow = show,
           let url = URL(string: apiShow.image.medium) {
            showImage.kf.setImage(with: url)
            self.title = apiShow.name
        }
        loadSeasons()
    }
    
    func saveSeasons(arraySeasons: [Season]) {
        self.arraySeasons = arraySeasons
        //tableView.reloadData()
    }
    
    func loadSeasons() {
        if let apiShow = self.show {
            AF.request("http://api.tvmaze.com/shows/\(apiShow.id!)/seasons").responseJSON  { response in
                print(response)
                if let arrayDictionary = response.value as? [[String: Any]] {
                    var arraySeasons = [Season]()
                    for dictionary in arrayDictionary {
                        let loadedData = Season(fromDictionary: dictionary)
                        arraySeasons.append(loadedData)
                    }
                    print(arraySeasons)
                    DispatchQueue.main.async {
                        self.saveSeasons(arraySeasons: arraySeasons)
                    }
                }
            }
        }
    }
}
