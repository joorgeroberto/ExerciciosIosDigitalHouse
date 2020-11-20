//
//  BrandController.swift
//  1120_DesafioMvc
//
//  Created by Jorge Roberto on 20/11/20.
//

import Foundation
import Alamofire
import UIKit

class BrandController: ControllerProtocol {
    var arrayBrands = [Brand]()
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        AF.request("\(Enviroment.apiBaseUrl)/carros/marcas").responseJSON  { response in
            //print(response)
            if let arrayDictionary = response.value as? [[String: Any]] {
                var arrayBrands = [Brand]()
                for dictionary in arrayDictionary {
                    let loadedData = Brand(fromDictionary: dictionary)
                    arrayBrands.append(loadedData)
                }
                self.arrayBrands = arrayBrands
                onComplete(true)
                return
            }
            onComplete(false)
        }
    }
    
    func getNumberOfRows() -> Int {
        return arrayBrands.count
    }
    
    func getNextController(index: Int) -> UIViewController {
        let controller = ModelController(brand: arrayBrands[index])
        return DefaultListViewController.getView(controller: controller)
    }
    
    func getTitleForCell(at index: Int) -> String {
        return arrayBrands[index].name
    }
    
    func getViewTitle() -> String {
        return "Marcas"
    }
    
    
}
