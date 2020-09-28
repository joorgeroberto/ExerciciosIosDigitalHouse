//
//  ViewController.swift
//  0925_ExercicioListaDeCompras
//
//  Created by Jorge Roberto on 26/09/20.
//
//
// Objetivo:
//  Criar um app de Lista de Compras:
//  - Um item de compra, deve ter nome e quantidade OK!
//  - Eu posso: Criar, Editar, Excluir
//  - Ao inserir o nome do produto, o app já deve verificar se existe ou nao e mostrar numa label. Se já existe, deve trazer a quantidade no textField de quantidade.
//  Deve tbm mudar o texto dos botões de acordo com as opções.
//  - Se eu tentar criar um item já existente, devo somente atualizar a quantidade.
//  - O app deve exibir em uma label o nome dos itens existentes
//  - Deve exibir um botão Limpar que limpa toda tela
//
//  Layout quando insere um novo:
//      [Digite o nome do produto aqui     ]
//      [Digite a quantidade aqui          ]
//  Produto novo
//      [Salvar] [Limpar]
//
//  Amaciante
//  Sabão
//  Detergente
//  Pão
//---------------------------------------
//  Layout quando insere um existente:
//      [Amaciante     ]
//      [2             ]
//  Produto já existente
//      [Salvar edição] [Excluir] [Limpar]
//
//  Amaciante
//  Sabão
//  Detergente
//  Pão
//
//  Sobre o Desenvolvimento:
//  - Classe de item deve estar numa classe num arquivo separado.
//  - Para verificar se o item existe, deve ser colocada a string tudo para minusculo e ignorar caracteres especiais.
//  - A lista deve ser exibida para o usuário numa label.
//  - Ao clicar em qualquer botão, deve esconder o teclado.
//  - No campo quantidade, o teclado deve ser numérico.
//  let nome = "Jorge"
//  print(nome.folding(options: .diacriticInsensitive, locale: .current).lowercased()) // narlei
//
//  Removendo item do array:
//  https://stackoverflow.com/questions/24051633/how-to-remove-an-element-from-an-array-in-swift

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldQuantity: UITextField!
    
    @IBOutlet weak var tableViewList: UITableView!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var itemList = ItemManager()
    
    
    @IBAction func saveButtonAction(_ sender: Any) {
        if let newItem = itemList.create(name: textFieldName.text!, quantity: Double(textFieldQuantity.text!) ?? 0) {
            tableViewList.reloadData()
        }
        
    }
    
    @IBAction func clearButtonAction(_ sender: Any) {
        textFieldName.text = ""
        textFieldQuantity.text = ""
    }
    
    @IBAction func deleteButtonAction(_ sender: Any) {    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.hideKeyboardWhenTappedAround()

        saveButton.layer.cornerRadius = 5
        clearButton.layer.cornerRadius = 5
        deleteButton.layer.cornerRadius = 5
        
        textFieldName.delegate = self
        textFieldQuantity.delegate = self
        
        tableViewList.delegate = self
        tableViewList.dataSource = self
        
        deleteButton.isHidden = true
        
        itemList.create(name: "Cachaca", quantity: 50)
        itemList.create(name: "aa", quantity: 50)
        if let list = itemList.getList() {
            for item in list {
                print("\(item.name), \(item.quantity)")
            }
        }
        tableViewList.reloadData()

    }


}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == textFieldName) {
            if(itemList.exists(textFieldName.text!)) {
                textFieldQuantity.text = String(itemList.getItem(name: textFieldName.text!)!.quantity)
                saveButton.setTitle("Salvar edição", for: .normal)
                deleteButton.isHidden = false
                view.endEditing(true)
            }
            else {
                textFieldQuantity.becomeFirstResponder()
            }
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

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = itemList.getList()![indexPath.row]
        print(item.name)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.getList()!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Nome: \(itemList.getList()![indexPath.row].name)    |    Quantidade: \(itemList.getList()![indexPath.row].quantity)"
        
        return cell
    }
}
