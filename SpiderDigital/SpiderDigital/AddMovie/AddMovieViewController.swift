//
//  AddMovieViewController.swift
//  SpiderDigital
//
//  Created by Jorge Roberto on 19/10/20.
//

import UIKit

class AddMovieViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var genderInput: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
        title = "Adicionar filme"
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 8
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        if(!nameInput.text!.isEmpty && !genderInput.text!.isEmpty) {
            
        }
    }
    
    

}
