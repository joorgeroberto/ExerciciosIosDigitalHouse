//
//  CarCollectionViewCell.swift
//  0930_DesafioCollectionView_Carros
//
//  Created by Jorge Roberto on 04/10/20.
//

import UIKit

class CarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carName: UILabel!
    func setup(_ car: Car) {
        //var newSize = CGSize(width: 100.0, height: 100.0)
        carName.text = car.name
        carImage.image = nil
        carImage.image = UIImage(named: car.image)
    }
}
