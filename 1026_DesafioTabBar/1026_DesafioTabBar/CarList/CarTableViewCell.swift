//
//  CarTableViewCell.swift
//  1026_DesafioTabBar
//
//  Created by Jorge Roberto on 26/10/20.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelBrand: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(car: Car) {
        labelName.text = car.name
        labelBrand.text = car.brand
    }
}
