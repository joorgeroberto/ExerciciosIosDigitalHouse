//
//  MyViewOneViewController.swift
//  ExercicioNavigation
//
//  Created by Jorge on 21/09/20.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class MyViewOneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MyViewOne"
    }
    
    @IBAction func actionMyViewOneModal(_ sender: Any) {
        if let myViewOneModalViewDetail = UIStoryboard(name: "MyViewOneModal", bundle: nil).instantiateInitialViewController() as? MyViewOneModalViewController {
            present(myViewOneModalViewDetail, animated: true)
        }
    }
    
    @IBAction func actionMyViewOnePushed(_ sender: Any) {
        if let myViewOnePushedViewDetail = UIStoryboard(name: "MyViewOnePushed", bundle: nil).instantiateInitialViewController() as? MyViewOnePushedViewController {
            navigationController?.pushViewController(myViewOnePushedViewDetail, animated: true)
        }
    }
    
}
