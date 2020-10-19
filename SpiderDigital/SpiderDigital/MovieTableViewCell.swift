//
//  MovieTableViewCell.swift
//  SpiderDigital
//
//  Created by Jorge Roberto on 18/10/20.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var genderNameLabel: UILabel!
    @IBOutlet weak var movieStarsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(movie: Movie) {
        movieNameLabel.text = movie.name
        genderNameLabel.text = movie.gender
        movieStarsLabel.text = "\(movie.stars) ⭐️"
        movieImage.image = UIImage(named: movie.imageName)
    }

}
