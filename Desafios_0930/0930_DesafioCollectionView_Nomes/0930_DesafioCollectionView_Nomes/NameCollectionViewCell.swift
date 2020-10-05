//
//  NameCollectionViewCell.swift
//  0930_DesafioCollectionView_Nomes
//
//  Created by Jorge Roberto on 05/10/20.
//

import UIKit

class NameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    func setup(name: String) {
        labelName.text = name
        labelName.layer.cornerRadius = 50
        labelName.layer.masksToBounds = true
        labelName.backgroundColor = .lightGray
    }
}
