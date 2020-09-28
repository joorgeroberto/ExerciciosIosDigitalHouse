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
    override func awakeFromNib() {
        super.awakeFromNib()
        devImage.layer.cornerRadius = 20
    }

    func setup(developer: Developer, indexPath: Int) {
        devImage.image = nil
        devName.text = ""
        
        devImage.image = UIImage(named: developer.image)
        devName.text = developer.name
        if(indexPath % 2 == 0) {
            self.backgroundColor = .lightGray
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
