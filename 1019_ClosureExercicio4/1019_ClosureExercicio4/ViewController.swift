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
                present(viewController, animated: true, completion: nil)
            viewController.register(completion: {(login, password) in
                loginTextField.text = login
                passwordTextField.text = password
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

