//
//  MyViewTwoViewController.swift
//  ExercicioNavigation
//
//  Created by Jorge on 21/09/20.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class MyViewTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MyViewTwo"
    }
    

    @IBAction func actionMyViewTwoPushed(_ sender: Any) {
        if let viewDetail = UIStoryboard(name: "MyViewTwoPushed", bundle: nil).instantiateInitialViewController() as? MyViewTwoPushedViewController {
            navigationController?.pushViewController(viewDetail, animated: true)
        }
    }
    
    @IBAction func actionMyViewTwoModal(_ sender: Any) {
        if let viewDetail = UIStoryboard(name: "MyViewTwoModal", bundle: nil).instantiateInitialViewController() as? MyViewTwoModalViewController {
            present(viewDetail, animated: true)
        }
    }
    
}
