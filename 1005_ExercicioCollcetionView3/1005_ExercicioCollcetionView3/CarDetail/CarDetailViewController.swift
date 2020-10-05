//
//  CarDetailViewController.swift
//  1005_ExercicioCollcetionView3
//
//  Created by Jorge Roberto on 05/10/20.
//

import UIKit

class CarDetailViewController: UIViewController {
    var car: Car?
    @IBOutlet weak var carImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = car!.name
        
        carImage.image = UIImage(named: car!.image!)
    }
    

}
