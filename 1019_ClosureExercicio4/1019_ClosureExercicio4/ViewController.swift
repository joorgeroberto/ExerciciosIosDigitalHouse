//
//  ViewController.swift
//  1019_ClosureExercicio4
//
//  Created by Jorge Roberto on 19/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func registerAction(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Cadastro", bundle: nil).instantiateInitialViewController() as? CadastroViewController {
            //viewController.register((login, password) in
            // OU
            viewController.register{ (login, password) in
                print(login, password)
                self.loginTextField.text = login
                self.passwordTextField.text = password
            }
            print(viewController)
            present(viewController, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

