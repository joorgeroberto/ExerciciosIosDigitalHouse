//
//  ViewController.swift
//  1028_ExercicioUIAlert
//
//  Created by Jorge Roberto on 28/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func abrirAlertAction(_ sender: Any) {
        let alert = UIAlertController(title: "Atenção",
                                      message: "Escolha a opção",
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Coxinha", style: .default, handler: { (action) in
            print("Coxinha")
        }))
        alert.addAction(UIAlertAction(title: "Kibe", style: .default, handler: { (action) in
            print("Kibe")
        }))
        alert.addAction(UIAlertAction(title: "Risoles", style: .default, handler: { (action) in
            print("Risoles")
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action) in
            print("Cancelar")
        }))
        alert.addAction(UIAlertAction(title: "Nenhuma, ainda é cedo", style: .destructive, handler: { (action) in
            print("Nenhuma")
        }))
        
        if let popoverController = alert.popoverPresentationController {
           popoverController.sourceView = self.view //to set the source of your alert
           popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0) // you can set this as per your requirement.
           popoverController.permittedArrowDirections = [] //to hide the arrow of any particular direction
       }
        
        
        present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

