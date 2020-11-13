//
//  EpisodeTableViewCell.swift
//  1113_TvMazeApi
//
//  Created by Jorge Roberto on 13/11/20.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var episodeSummaryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(episode: Episode) {
        if let episodeNumber = episode.number {
            self.episodeNumber.text = "Episode \(episodeNumber)"
        }
        episodeNameLabel.text = episode.name
        episodeSummaryLabel.text = episode.summary
    }

}
