//
//  CarCollectionViewCell.swift
//  0930_DesafioCollectionView
//
//  Created by Jorge Roberto on 30/09/20.
//

import UIKit

class CarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var carImage: UIImageView!
    func setup(imageName: String) {
        
        carImage.image = nil
        carImage.image = UIImage(named: imageName)
    }
}
