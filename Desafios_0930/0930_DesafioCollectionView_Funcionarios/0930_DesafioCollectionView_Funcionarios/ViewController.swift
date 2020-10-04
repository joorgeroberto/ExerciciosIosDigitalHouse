//
//  ViewController.swift
//  0930_DesafioCollectionView_Funcionarios
//
//  Created by Jorge Roberto on 30/09/20.
//
//  01 - Criar um app:
//  - Tenha uma lista (tableView) com 15 pessoas.
//  - Cada célula (linha) deve ter o nome, cargo e email de uma pessoa. OK!
//  - Quando tocar numa celula, deve abrir uma tela em modal, nessa tela deve haver um botão de fechar e um label com o nome da pessoa.


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayEmployee = [Employee]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        arrayEmployee.append(Employee(name: "Jorge Roberto", role: "Developer", email: "jorgercj@dcomp.ufs.br"))
        arrayEmployee.append(Employee(name: "Narlei Moreira", role: "Developer", email: "narlei@gmail.com"))
        arrayEmployee.append(Employee(name: "Jessica Santana", role: "Developer", email: "jessica@gmail.com"))
        arrayEmployee.append(Employee(name: "Cesar Tavares", role: "Developer", email: "cesartavares@gmail.com"))
        arrayEmployee.append(Employee(name: "Gustavo Schwarz", role: "Developer", email: "gustavosch@gmail.com"))
        
        arrayEmployee.append(Employee(name: "Marivaldo Senha", role: "Developer", email: "marivaldo@gmail.com"))
        arrayEmployee.append(Employee(name: "Marcela Saidel", role: "Developer", email: "marcela@gmail.com"))
        arrayEmployee.append(Employee(name: "Mízia Lima", role: "Developer", email: "mizia@gmail.com"))
        arrayEmployee.append(Employee(name: "Otavio Brito", role: "Developer", email: "otavio@gmail.com"))
        arrayEmployee.append(Employee(name: "Paola Pagoto", role: "Developer", email: "paola@gmail.com"))
        
        arrayEmployee.append(Employee(name: "Fernanda Fernandes", role: "Developer", email: "fernanda@gmail.com"))
        arrayEmployee.append(Employee(name: "Michel dos Santos", role: "Developer", email: "michel@gmail.com"))
        arrayEmployee.append(Employee(name: "Wedson Chaves", role: "Developer", email: "wedson@gmail.com"))
        arrayEmployee.append(Employee(name: "Cleís Aurora", role: "Developer", email: "cleis@gmail.com"))
        arrayEmployee.append(Employee(name: "Daniel Oliveira", role: "Developer", email: "daniel@gmail.com"))
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = arrayEmployee[indexPath.row]
        print(arrayEmployee[indexPath.row])
        
        if let detailModal = UIStoryboard(name: "DetailModal", bundle: nil).instantiateInitialViewController() as? DetailModalViewController {
            detailModal.employee = employee
            present(detailModal, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayEmployee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as! EmployeeTableViewCell
        
        cell.setup(employee: arrayEmployee[indexPath.row])
        return cell
    }
    
    
}
