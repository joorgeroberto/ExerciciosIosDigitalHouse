//
//  SeasonTableViewCell.swift
//  1113_TvMazeApi
//
//  Created by Jorge Roberto on 13/11/20.
//

import UIKit

class SeasonTableViewCell: UITableViewCell {

    @IBOutlet weak var seasonName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(season: Season) {
        seasonName.text = season.name
    }

}
