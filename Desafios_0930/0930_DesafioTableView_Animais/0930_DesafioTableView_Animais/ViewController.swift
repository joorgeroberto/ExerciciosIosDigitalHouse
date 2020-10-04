//
//  ViewController.swift
//  0930_DesafioTableView_Animais
//
//  Created by Jorge Roberto on 03/10/20.
//

//02 - Criar um app:
//- Tenha uma lista (tableView) com 10 animais. - OK!
//- Cada célula (linha) deve ter o nome, raça, peso e espécie de um animal. - OK!
//- Quando tocar numa celula, deve abrir uma tela em modal, nessa tela deve haver um botão de fechar e um label com o nome do animal.

import UIKit

class ViewController: UIViewController {

    var animals = [Animal]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        animals.append(Animal(name: "Leia", breed: "Chow Chow", weight: "20", species: "Cachorro"))
        animals.append(Animal(name: "Luke", breed: "Chow Chow", weight: "20", species: "Cachorro"))
        animals.append(Animal(name: "Bob", breed: "Praiano", weight: "5", species: "Cachorro"))
        animals.append(Animal(name: "Xaninho", breed: "Siamês", weight: "3", species: "Gato"))
        animals.append(Animal(name: "Vira Lata Caramelho", breed: "Vira Lata", weight: "5", species: "Cachorro"))
        
        animals.append(Animal(name: "Luke", breed: "Chow Chow", weight: "4", species: "Cachorro"))
        animals.append(Animal(name: "Mimosa", breed: "Nelore", weight: "430", species: "Vaca"))
        animals.append(Animal(name: "Estrelinha", breed: "Angus", weight: "440", species: "Vaca"))
        animals.append(Animal(name: "Marley", breed: "Labrador", weight: "20", species: "Cachorro"))
        animals.append(Animal(name: "Belinha", breed: "Poodle", weight: "10", species: "Cachorro"))
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(animals[indexPath.row])
        if let animalDetail = UIStoryboard(name: "AnimalDetail", bundle: nil).instantiateInitialViewController() as? AnimalDetailViewController {
            animalDetail.animal = animals[indexPath.row]
            tableView.deselectRow(at: indexPath, animated: true)
            present(animalDetail, animated: true, completion: nil)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! AnimalTableViewCell
        cell.setup(animals[indexPath.row])
        return cell
    }
    
    
}
