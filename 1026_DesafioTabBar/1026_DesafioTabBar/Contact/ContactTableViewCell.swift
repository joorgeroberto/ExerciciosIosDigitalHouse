//
//  ContactTableViewCell.swift
//  1026_DesafioTabBar
//
//  Created by Jorge Roberto on 26/10/20.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var contactLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(info: String) {
        contactLabel.text = info
    }
}
