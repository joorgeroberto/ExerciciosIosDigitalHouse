//
//  CarDetailViewController.swift
//  1026_DesafioTabBar
//
//  Created by Jorge Roberto on 26/10/20.
//

import UIKit

class CarDetailViewController: UIViewController {
    var car: Car?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = car!.name
    }

}
