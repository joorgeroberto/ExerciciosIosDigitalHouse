//
//  MyViewTwoPushedViewController.swift
//  ExercicioNavigation
//
//  Created by Jorge on 21/09/20.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class MyViewTwoPushedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MyViewTwo Pushed"
    }
    
    
    @IBAction func actionVoltar(_ sender: Any) {
        if let viewDetail = UIStoryboard(name: "MyViewTwo", bundle: nil).instantiateInitialViewController() as? MyViewTwoViewController {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
