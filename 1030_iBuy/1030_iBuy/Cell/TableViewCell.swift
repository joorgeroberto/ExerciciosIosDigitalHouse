//
//  TableViewCell.swift
//  1030_iBuy
//
//  Created by Jorge Roberto on 30/10/20.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var itemName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(item: Item) {
        itemName.text = item.name
    }
}
