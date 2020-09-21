//
//  MyViewOnePushedViewController.swift
//  ExercicioNavigation
//
//  Created by Jorge on 21/09/20.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class MyViewOnePushedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MyViewOne Pushed"
    }

    @IBAction func actionVoltar(_ sender: Any) {
        if let viewDetail = UIStoryboard(name: "MyViewOne", bundle: nil).instantiateInitialViewController() as? MyViewOneViewController {
            navigationController?.popViewController(animated: true)
        }
    }
}
