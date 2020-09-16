//
//  Usuario.swift
//  DesafioLoginCadastro
//
//  Created by Jorge on 14/09/20.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class Usuario {
    private var email: String
    private var senha: String
    
    init(email: String, senha: String) {
        self.email = email
        self.senha = senha
    }
    
    func getEmail() -> String {
        return self.email
    }
    
    func setEmail(_ email: String) {
        self.email = email
    }
    
    func getSenha() -> String {
        return self.senha
    }
    
    func setSenha(_ senha: String) {
        self.senha = senha
    }
}
