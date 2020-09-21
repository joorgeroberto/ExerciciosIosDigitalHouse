//
//  MyViewThreeViewController.swift
//  ExercicioNavigation
//
//  Created by Jorge on 21/09/20.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class MyViewThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MyViewThree"
    }
    
    @IBAction func actionMyViewThreePushed(_ sender: Any) {
        if let viewDetail = UIStoryboard(name: "MyViewThreePushed", bundle: nil).instantiateInitialViewController() as? MyViewThreePushedViewController {
            navigationController?.pushViewController(viewDetail, animated: true)
        }
    }
    
    @IBAction func actionMyViewThreeModal(_ sender: Any) {
        if let viewDetail = UIStoryboard(name: "MyViewThreeModal", bundle: nil).instantiateInitialViewController() as? MyViewThreeModalViewController {
            present(viewDetail, animated: true)
        }
    }
}
