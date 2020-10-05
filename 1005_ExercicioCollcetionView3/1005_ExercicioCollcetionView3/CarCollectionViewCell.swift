//
//  CarCollectionViewCell.swift
//  1005_ExercicioCollcetionView3
//
//  Created by Jorge Roberto on 05/10/20.
//

import UIKit

class CarCollectionViewCell: UICollectionViewCell {
    var car: Car?
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carLabel: UILabel!
    
    func setup(car: Car) {
        carImage.image = UIImage(named: car.image!)
        carLabel.text = car.name!
    }
}
