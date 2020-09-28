//
//  MyCustomCell.swift
//  0928_DeafioTableView
//
//  Created by Jorge Roberto on 28/09/20.
//

import UIKit

class MyCustomCell: UITableViewCell {

    @IBOutlet weak var devImage: UIImageView!
    @IBOutlet weak var devName: UILabel!
    @IBOutlet weak var devEmail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        devImage.layer.cornerRadius = 20
    }

    func setup(developer: Developer) {
        devImage.image = nil
        devName.text = ""
        devEmail.text = ""
        
        devImage.image = UIImage(named: developer.image)
        devName.text = developer.name
        devEmail.text = developer.email
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
