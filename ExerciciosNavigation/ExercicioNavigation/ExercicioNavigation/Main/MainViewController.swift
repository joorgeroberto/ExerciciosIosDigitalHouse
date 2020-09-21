//
//  MainViewController.swift
//  ExercicioNavigation
//
//  Created by Jorge on 21/09/20.
//  Copyright © 2020 Jorge. All rights reserved.
//

/*
 Criar 9 Telas:
 MyViewOne
     MyViewOneViewController.swift
     MyViewOne.storyboard
 MyViewOneModal
 MyViewOnePushed
 MyViewTwo
 MyViewTwoModal
 MyViewTwoPushed
 MyViewThree
 MyViewThreeModal
 MyViewThreePushed
 o Main.Storyboard deve ser Embedded numa navigation.
 o Main.Storyboard deve ter 9 botões, cada um chama uma tela, pelo navigation.
 A One deve ter 2 botões:
     Um chama o Modal
     Outro chama pelo navigation
 E assim para todas telas.
*/

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Main"
    }

    @IBAction func actionMyViewOne(_ sender: Any) {
        if let viewDetail = UIStoryboard(name: "MyViewOne", bundle: nil).instantiateInitialViewController() as? MyViewOneViewController {
            navigationController?.pushViewController(viewDetail, animated: true)
        }
        
    }
    
    @IBAction func actionMyViewOnePushed(_ sender: Any) {
        if let myViewOnePushedViewDetail = UIStoryboard(name: "MyViewOnePushed", bundle: nil).instantiateInitialViewController() as? MyViewOnePushedViewController {
            navigationController?.pushViewController(myViewOnePushedViewDetail, animated: true)
        }
    }
    
    @IBAction func actionMyViewOneModal(_ sender: Any) {
        if let viewDetail = UIStoryboard(name: "MyViewOneModal", bundle: nil).instantiateInitialViewController() as? MyViewOneModalViewController {
            present(viewDetail, animated: true)
        }
    }
    
    @IBAction func actionMyViewTwo(_ sender: Any) {
        if let viewDetail = UIStoryboard(name: "MyViewTwo", bundle: nil).instantiateInitialViewController() as? MyViewTwoViewController {
            navigationController?.pushViewController(viewDetail, animated: true)
        }
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
    
    @IBAction func actionMyViewThree(_ sender: Any) {
        if let viewDetail = UIStoryboard(name: "MyViewThree", bundle: nil).instantiateInitialViewController() as? MyViewThreeViewController {
            navigationController?.pushViewController(viewDetail, animated: true)
        }
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
