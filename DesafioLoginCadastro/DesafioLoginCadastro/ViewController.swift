//
//  ViewController.swift
//  DesafioLoginCadastro
//
//  Created by Jorge on 14/09/20.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var usuariosCadastrados = [Usuario]()
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnCadastrar: UIButton!
    
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldSenha: UITextField!
    
    @IBAction func btnLoginAction(_ sender: Any) {
        if (validarInputs()) {
            realizarLogin()
        }
    }
    
    @IBAction func btnCadastrarAction(_ sender: Any) {
        if(validarInputs()) {
            realizarCadastro()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnLogin.layer.cornerRadius = 15
        btnCadastrar.layer.cornerRadius = 15

        self.hideKeyboardWhenTappedAround()
        textFieldEmail.delegate = self
        textFieldSenha.delegate = self
    }

    func mostrarAlerta(_ mensagem: String) {
        // Comeca alerta
        let alert = UIAlertController(title: "Atenção", message: mensagem, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .cancel) {
            (UIAlertAction) in
        }
        alert.addAction(okAction)
        self.present(alert, animated: true) {
           
        }
        // Termina alerta
    }
    
    func validarInputs() -> Bool {
        if (textFieldEmail.text == nil || textFieldEmail.text!.isEmpty) {
            mostrarAlerta("Por favor, digite um email e senha válidos!")
            return false
        }
        if (textFieldSenha.text == nil || textFieldSenha.text!.isEmpty) {
            mostrarAlerta("Por favor, digite um email e senha válidos!")
            return false
        }
        return true
    }
    
    func realizarCadastro() {
        for usuarioCadastrado in usuariosCadastrados {
            if(usuarioCadastrado.getEmail() == textFieldEmail.text!) {
                mostrarAlerta("Usuário já cadastrado!")
                return
            }
        }
        
        let usuario = Usuario(email: textFieldEmail.text!, senha: textFieldSenha.text!)
        usuariosCadastrados.append(usuario)
        
        limparInputs()
        
        mostrarAlerta("Usuário cadastrado com sucesso!")
        return
    }
    
    func realizarLogin() {
        for usuarioCadastrado in usuariosCadastrados {
            if (usuarioCadastrado.getEmail() == textFieldEmail.text) {
                if (usuarioCadastrado.getSenha() == textFieldSenha.text) {
                    limparInputs()
                    
                    mostrarAlerta("Login realizado com sucesso!")
                    return
                }
                else {
                    mostrarAlerta("Senha incorreta!")
                    return
                }
            }
        }
        mostrarAlerta("Usuário não cadastrado!")
        return
    }
    
    func limparInputs() {
        textFieldEmail.text = ""
        textFieldSenha.text = ""
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == textFieldEmail) {
            textFieldSenha.becomeFirstResponder()
        }
        else {
            view.endEditing(true)
        }
        return true
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
