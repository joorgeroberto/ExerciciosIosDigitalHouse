//
//  CarDetailViewController.swift
//  0930_DesafioCollectionView_Carros
//
//  Created by Jorge Roberto on 04/10/20.
//

import UIKit

class CarDetailViewController: UIViewController {

    var car: Car?
    @IBOutlet weak var carImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = car!.name
        carImage.image = nil
        carImage.image = UIImage(named: car!.image)
    }

}
