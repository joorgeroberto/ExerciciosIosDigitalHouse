//
//  BrandCell.swift
//  1202_Sqlite
//
//  Created by Jorge Roberto on 02/12/20.
//

import UIKit

class BrandCell: UITableViewCell {

    @IBOutlet weak var brandLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(brand: Brand, favorite: Favorite) {
        self.backgroundColor = .white
        if let code = favorite.code  {
            if code == brand.code {
                self.backgroundColor = .red
            }
        }
        self.brandLabel.text? = brand.name
    }
}
