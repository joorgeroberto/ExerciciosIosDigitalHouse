//
//  ShowTableViewCell.swift
//  1113_TvMazeApi
//
//  Created by Jorge Roberto on 13/11/20.
//

import UIKit

class ShowTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(show: Show) {
        titleLabel.text = show.name
        subtitleLabel.text = "\(show.id!)"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
