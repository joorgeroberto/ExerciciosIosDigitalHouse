//
//  ViewController.swift
//  1005_ExercicioIBOutletAvancado
//
//  Created by Jorge Roberto on 05/10/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var thisIsALabel: UILabel!
    @IBOutlet weak var thisIsAButton: UIButton!
    @IBOutlet weak var thisIsATextField: UITextField!
    @IBOutlet weak var thisIsASearchBar: UISearchBar!
    @IBOutlet weak var thisIsAImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thisIsALabel.text = "This is a Label"
        thisIsAButton.setTitle("This is a Button", for: .normal)
        thisIsATextField.placeholder = "This is a Text Field"
        thisIsASearchBar.placeholder = "This is a Search Bar"
        thisIsAImage.image = nil
        thisIsAImage.image = UIImage(named: "jorge.jpeg")
    }
    
    @IBAction func actionButton(sender: UIButton) {
        print("This is a Button!")
    }


}

