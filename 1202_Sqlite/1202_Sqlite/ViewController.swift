//
//  ViewController.swift
//  1202_Sqlite
//
//  Created by Jorge Roberto on 02/12/20.
//

import UIKit
import Alamofire
import NAMDatabase

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrayBrands = [Brand]()
    var favorite = Favorite()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
    }

    func saveSeasons(arrayBrands: [Brand]) {
        self.arrayBrands = arrayBrands
        tableView.reloadData()
    }
    
    func loadData() {
        if let favorite = Favorite.getObjectWithId("1") as? Favorite {
            self.favorite = favorite
        }
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas").responseJSON  { response in
            //print(response)
            if let arrayDictionary = response.value as? [[String: Any]] {
                var arrayBrands = [Brand]()
                for dictionary in arrayDictionary {
                    let loadedData = Brand(fromDictionary: dictionary)
                    arrayBrands.append(loadedData)
                }
                //print(arraySeasons)
                DispatchQueue.main.async {
                    self.saveSeasons(arrayBrands: arrayBrands)
                }
            }
        }
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Atenção", message: "Deseja adicionar \(arrayBrands[indexPath.row].name!) aos favoritos?", preferredStyle: .alert)
                
                
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            DispatchQueue.main.async {
                self.favorite.code = "\(self.arrayBrands[indexPath.row].code!)"
                self.favorite.identifier = "1"
                self.favorite.saveData()
                tableView.reloadData()
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: { (action) in
            print("Apertou Cancelar")
        }))
        
        present(alert, animated: true, completion: nil)
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayBrands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BrandCell") as! BrandCell
        cell.setup(brand: arrayBrands[indexPath.row], favorite: favorite)
        return cell
    }
    
    
}
