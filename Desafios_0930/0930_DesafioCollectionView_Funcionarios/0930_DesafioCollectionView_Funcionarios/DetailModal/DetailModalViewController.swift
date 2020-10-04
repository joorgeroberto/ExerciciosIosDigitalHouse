//
//  DetailModalViewController.swift
//  0930_DesafioCollectionView_Funcionarios
//
//  Created by Jorge Roberto on 03/10/20.
//

import UIKit

class DetailModalViewController: UIViewController {

    @IBOutlet weak var initialLabel: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelRole: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBAction func closeModalAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let employee = employee {
            initialLabel.text = ""
            initialLabel.layer.cornerRadius = 40
            initialLabel.layer.masksToBounds = true
            initialLabel.text = Employee.returnInitials(employee.name)
            labelName.text = employee.name
            labelRole.text = employee.role
            labelEmail.text = employee.email
        }
    }

}
