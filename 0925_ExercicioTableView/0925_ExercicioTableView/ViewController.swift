//
//  ViewController.swift
//  0925_ExercicioTableView
//
//  Created by Jorge Roberto on 25/09/20.
//
// Requisitos:
// Fazer uma Tableview que carregue o nome de 5 marcas de carro e carregue uma imagem de um carro fixo utilizando a UITableViewCell.
// Quando a pessoa clicar no carro, deve imprimir a marca do veiculo selecionado

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewList: UITableView!
    
    var arrayCars = [Car]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewList.delegate = self
        tableViewList.dataSource = self
        
        arrayCars.append(Car(brand: "Fiat", image: UIImage(named: "Uno.jpg")!))
        arrayCars.append(Car(brand: "Renault", image: UIImage(named: "Renault.jpg")!))
        arrayCars.append(Car(brand: "Chevrolet", image: UIImage(named: "chevrolet.webp")!))
        arrayCars.append(Car(brand: "BMW", image: UIImage(named: "bmw.jpg")!))
        arrayCars.append(Car(brand: "Ford", image: UIImage(named: "ford.jpg")!))
    }
    
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = arrayCars[indexPath.row]
        
        print ("Selecionou \(car.brand)")
        
        if let carDetailView = CarDetailViewController.getViewController() {
            carDetailView.car = car
            present(carDetailView, animated: true, completion: nil)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        // Info indicator button
        //cell.accessoryType = .detailDisclosureButton
        
        cell.imageView?.image = arrayCars[indexPath.row].image
        cell.textLabel?.text = arrayCars[indexPath.row].brand
        
        return cell
    }
}
