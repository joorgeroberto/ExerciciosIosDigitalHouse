//
//  ViewController.swift
//  1014_DesafioPickerView
//
//  Created by Jorge Roberto on 15/10/20.
//

import UIKit

class ViewController: UIViewController {
    var citiesList = [City]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableViewList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewList.delegate = self
        tableViewList.dataSource = self
        
        citiesList.append(City(name: "Aracaju", state: "Sergipe", country: "Brasil", numberOfInhabitants: 571149, temperatureInCelsiusDegrees: 26))
        citiesList.append(City(name: "São Cristóvão", state: "Sergipe", country: "Brasil", numberOfInhabitants: 85814, temperatureInCelsiusDegrees: 26))
        citiesList.append(City(name: "Poço Verde", state: "Sergipe", country: "Brasil", numberOfInhabitants: 23728, temperatureInCelsiusDegrees: 22))
        citiesList.append(City(name: "Tobias Barreto", state: "Sergipe", country: "Brasil", numberOfInhabitants: 52191, temperatureInCelsiusDegrees: 22))
        citiesList.append(City(name: "Itabaianinha", state: "Sergipe", country: "Brasil", numberOfInhabitants: 42166, temperatureInCelsiusDegrees: 22))
        
        citiesList.append(City(name: "Toronto", state: "Ontário", country: "Canadá", numberOfInhabitants:  2930000, temperatureInCelsiusDegrees: 10))
        citiesList.append(City(name: "Vancouver", state: "Colúmbia Britânica", country: "Canadá", numberOfInhabitants: 675218, temperatureInCelsiusDegrees: 12))
        citiesList.append(City(name: "Motreal", state: "Quebec", country: "Canadá", numberOfInhabitants: 1780000, temperatureInCelsiusDegrees: 12))
        citiesList.append(City(name: "Ottawa", state: "Ontário", country: "Canadá", numberOfInhabitants: 994837, temperatureInCelsiusDegrees: 11))
        citiesList.append(City(name: "Quebec", state: "Quebec", country: "Canadá", numberOfInhabitants: 542298, temperatureInCelsiusDegrees: 12))
        
        citiesList.append(City(name: "Paris", state: "Île-de-France", country: "França", numberOfInhabitants: 2148000, temperatureInCelsiusDegrees: 10))
        citiesList.append(City(name: "Montpellier", state: "Hérault", country: "França", numberOfInhabitants: 277639, temperatureInCelsiusDegrees: 12))
        citiesList.append(City(name: "Lille", state: "Altos da França", country: "França", numberOfInhabitants: 232741, temperatureInCelsiusDegrees: 9))
        citiesList.append(City(name: "Versalhes", state: "Ilha de França", country: "França", numberOfInhabitants: 85771, temperatureInCelsiusDegrees: 8))
        citiesList.append(City(name: "Lyon", state: "Auvérnia-Ródano-Alpes", country: "França", numberOfInhabitants: 513275, temperatureInCelsiusDegrees: 10))
        
    }


}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableViewList.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! CityTableViewCell
        tableViewCell.setup(city: citiesList[indexPath.row])
        return tableViewCell
    }
    
    
}
