//
//  ViewController.swift
//  1009_Exercicio_DatePicker
//
//  Created by Jorge Roberto on 09/10/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelName: UILabel!
    @IBAction func actionDatePicker(_ sender: UIDatePicker) {
        // Criando o DateFormatter.
        let dateFormatter = DateFormatter()
        
        // Configurando o estilo da data e da hora.
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        // Transformando a data em string e guardando o valor recebido em uma nova variavel.
        let strDate = dateFormatter.string(from: sender.date)
        print(strDate)
        labelName.text = strDate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

