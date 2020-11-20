//
//  ModelController.swift
//  1120_DesafioMvc
//
//  Created by Jorge Roberto on 20/11/20.
//

import Foundation
import UIKit
import Alamofire

class ModelController: ControllerProtocol {
    var arrayModels = [Model]()
    var brand: Brand
    
    init(brand: Brand) {
        self.brand = brand
    }
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        AF.request("\(Enviroment.apiBaseUrl)/carros/marcas/\(brand.id!)/modelos").responseJSON  { response in
            if let dictionaryModel = response.value as? [String: Any], let arrayDictionary = dictionaryModel["modelos"] as? [[String: Any]] {
                var arrayModels = [Model]()
                for dictionary in arrayDictionary {
                    let loadedData = Model(fromDictionary: dictionary)
                    arrayModels.append(loadedData)
                }
                self.arrayModels = arrayModels
                onComplete(true)
                return
            }
            onComplete(false)
        }
    }
    
    func getNumberOfRows() -> Int {
        return arrayModels.count
    }
    
    func getNextController(index: Int) -> UIViewController {
        return UIViewController()
    }
    
    func getTitleForCell(at index: Int) -> String {
        return "\(arrayModels[index].name!)"
    }
    
    func getViewTitle() -> String {
        return "Modelos \(brand.name!)"
    }
    
    
}
