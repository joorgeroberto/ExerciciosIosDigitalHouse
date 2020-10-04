//
//  EmployeeTableViewCell.swift
//  0930_DesafioCollectionView_Funcionarios
//
//  Created by Jorge Roberto on 30/09/20.
//

import UIKit
import Foundation

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelRole: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelInitial: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup (employee: Employee) {
        labelInitial.text = nil
        labelName.text = ""
        labelRole.text = ""
        labelEmail.text = ""
    
        labelInitial.layer.cornerRadius = 30
        labelInitial.layer.masksToBounds = true
        labelInitial.text = Employee.returnInitials(employee.name)
        labelName.text = employee.name
        labelRole.text = employee.role
        labelEmail.text = employee.email

    }
}
