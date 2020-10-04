//
//  File.swift
//  0930_DesafioCollectionView_Funcionarios
//
//  Created by Jorge Roberto on 30/09/20.
//

import Foundation

class Employee {
    var name: String
    var role: String
    var email: String
    
    init(name: String, role: String, email: String) {
        self.name = name
        self.role = role
        self.email = email
    }
    
    static func returnInitials(_ name: String) -> String {
        
        let fullName = name.split(separator: " ");
        if(fullName.count > 0) {
            var initialName = ""
            initialName = "\(fullName[0].prefix(1))"
            if(fullName.count > 1) {
                initialName = initialName + "\(fullName[1].prefix(1))"
            }
            return initialName
        }
        return ""
    }
}
