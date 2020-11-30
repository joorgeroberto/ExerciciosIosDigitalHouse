//
//  FipeAPI.swift
//  1130_MvvmFipe
//
//  Created by Jorge Roberto on 30/11/20.
//

import Foundation

class FipeAPI: NSObject {
    let apiManager = APIManager()
    let baseUrl = "https://parallelum.com.br/fipe/api/v1"
    
    private func parseData(response: Any?) -> [BaseClass]?  {
        if let arrayDictionary = response as? [[String: Any]] {
            var arrayBrands = [BaseClass]()
            for dictionary in arrayDictionary {
                let loadedData = BaseClass(fromDictionary: dictionary)
                arrayBrands.append(loadedData)
            }
            return arrayBrands
        }
        return nil
    }
    
    func getBrands(completion: @escaping ([BaseClass]?, Bool) -> Void) {
        apiManager.request(url: "\(baseUrl)/carros/marcas") { (response) in
            if let arrayBrands = self.parseData(response: response) {
                completion(arrayBrands, true)
                return
            }
            completion(nil, false)
        }
    }
    
    func getCarModels(brandId: String, completion: @escaping ([BaseClass]?, Bool) -> Void) {
        apiManager.request(url: "\(baseUrl)/carros/marcas/\(brandId)/modelos") { (response) in
            if let arrayDictionary = response as? [[String: Any]] {
                var arrayBrands = [BaseClass]()
                for dictionary in arrayDictionary {
                    let loadedData = BaseClass(fromDictionary: dictionary)
                    arrayBrands.append(loadedData)
                }
                completion(arrayBrands, true)
                return
            }
            completion(nil, false)
        }
    }
}
