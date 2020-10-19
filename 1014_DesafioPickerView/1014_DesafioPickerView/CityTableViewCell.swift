//
//  CityTableViewCell.swift
//  1014_DesafioPickerView
//
//  Created by Jorge Roberto on 15/10/20.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    @IBOutlet weak var cityLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(city: City) {
        cityLabel.text = city.name
    }

}
