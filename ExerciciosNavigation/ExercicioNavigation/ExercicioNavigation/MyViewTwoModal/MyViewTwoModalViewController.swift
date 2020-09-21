//
//  MyViewTwoModalViewController.swift
//  ExercicioNavigation
//
//  Created by Jorge on 21/09/20.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class MyViewTwoModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MyViewTwo Modal"
    }

    @IBAction func actionVoltar(_ sender: Any) {
        if let viewDetail = UIStoryboard(name: "MyViewTwo", bundle: nil).instantiateInitialViewController() as? MyViewTwoViewController {
            dismiss(animated: true)
        }
    }
}
