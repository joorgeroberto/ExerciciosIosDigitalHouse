//
//  MovieDetailViewController.swift
//  SpiderDigital
//
//  Created by Jorge Roberto on 18/10/20.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var movie: Movie?
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = movie!.name
        
        movieImage.image = UIImage(named: movie!.imageName)
        movieNameLabel.text = movie!.name
    }
    

    

}
