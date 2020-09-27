//
//  CarDetailViewController.swift
//  0925_ExercicioTableView
//
//  Created by Jorge Roberto on 26/09/20.
//

import UIKit

class CarDetailViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    @IBAction func actionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    var car: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let car = car {
            textLabel.text = car.brand
            carImage.image = car.image
        }
    }
    
    static func getViewController() -> CarDetailViewController? {
        if let carDetailView = UIStoryboard(name: "CarDetail", bundle: nil).instantiateInitialViewController() as? CarDetailViewController {
            return carDetailView
        }
        
        return nil
    }
}
