//
//  MyViewThreeModalViewController.swift
//  ExercicioNavigation
//
//  Created by Jorge on 21/09/20.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class MyViewThreeModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MyViewThree Modal"
    }
    
    
    @IBAction func actionVoltar(_ sender: Any) {
        if let viewDetail = UIStoryboard(name: "MyViewThree", bundle: nil).instantiateInitialViewController() as? MyViewThreeViewController {
            dismiss(animated: true)
        }
    }
    
}
