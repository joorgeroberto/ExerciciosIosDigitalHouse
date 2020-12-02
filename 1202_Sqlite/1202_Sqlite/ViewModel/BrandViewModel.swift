//
//  BrandViewModel.swift
//  1202_Sqlite
//
//  Created by Jorge Roberto on 02/12/20.
//

import Foundation
import UIKit

class BrandViewModel: ViewModelProtocol {
    let fipeAPI = FipeAPI()
    var arrayBrands: [Brand]?
    var favorite = Favorite()
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        if let favorite = Favorite.getObjectWithId("1") as? Favorite {
            self.favorite = favorite
        }
        fipeAPI.getBrands { (arrayBrands, success) in
            self.arrayBrands = arrayBrands
            onComplete(success)
        }
    }
    
    func getNumberOfRows() -> Int {
        return arrayBrands?.count ?? 0
    }
    
    func getAlert(tableView: UITableView, indexPath: IndexPath) -> UIAlertController {
        let alert = UIAlertController(title: "Atenção", message: "Deseja adicionar \(arrayBrands![indexPath.row].name!) aos favoritos?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            DispatchQueue.main.async {
                self.favorite.code = "\(self.arrayBrands![indexPath.row].code!)"
                self.favorite.identifier = "1"
                self.favorite.saveData()
                tableView.reloadData()
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: { (action) in
            print("Apertou Cancelar")
        }))
        
        return alert
    }
    func getCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BrandCell") as! BrandCell
        cell.setup(brand: arrayBrands![indexPath.row], favorite: favorite)
        return cell
    }
    
    func getTitleForCell(at index: Int) -> String {
        return arrayBrands![index].name
    }
    
    
    func getViewTitle() -> String {
        return "Marcas"
    }
}
