//
//  AnimalDetailViewController.swift
//  0930_DesafioTableView_Animais
//
//  Created by Jorge Roberto on 04/10/20.
//

import UIKit

class AnimalDetailViewController: UIViewController {
    var animal: Animal?

    @IBOutlet weak var labelName: UILabel!
    @IBAction func buttonBackAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelName.text = animal?.name
    }
    

}
