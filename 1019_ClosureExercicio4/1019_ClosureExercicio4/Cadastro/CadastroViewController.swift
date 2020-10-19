//
//  CadastroViewController.swift
//  1019_ClosureExercicio4
//
//  Created by Jorge Roberto on 19/10/20.
//


/*
 Exercício 4: Crie um app:
 Tenha uma tela para preencher login e senha. Um botão de login e outro de cadastro.
 Ao clicar em cadastro, deve informar na nova tela aberta via modal, o email e senha.
 Quando clicar em cadastrar, deve retornar a tela de login, preenchendo os campos de login e senha.
 Use closure
*/

import UIKit

class CadastroViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func registerAction(_ sender: Any) {
        if(!loginTextField.text!.isEmpty && !passwordTextField.text!.isEmpty) {
            var registerVar: (_ login: String, _ password: String) -> Void
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func register(completion: (_ login: String, _ password: String) -> Void) {
        completion(loginTextField.text!, passwordTextField.text!)
    }
}
