//
//  AnimalTableViewCell.swift
//  0930_DesafioTableView_Animais
//
//  Created by Jorge Roberto on 03/10/20.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelBreed: UILabel!
    @IBOutlet weak var labelSpecies: UILabel!
    @IBOutlet weak var labelWeight: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(_ animal: Animal) {
        labelName.text = animal.name
        labelBreed.text = animal.breed
        labelSpecies.text = animal.species
        labelWeight.text = "\(animal.weight) kg"
        
    }
}
