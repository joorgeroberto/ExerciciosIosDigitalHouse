//
//  FipeAPI.swift
//  1202_Sqlite
//
//  Created by Jorge Roberto on 02/12/20.
//

import Foundation

class FipeAPI: NSObject {
    let apiManager = APIManager()
    let baseUrl = "https://parallelum.com.br/fipe/api/v1"
    
    private func parseData(response: Any?) -> [Brand]?  {
        if let arrayDictionary = response as? [[String: Any]] {
            var arrayBrands = [Brand]()
            for dictionary in arrayDictionary {
                let loadedData = Brand(fromDictionary: dictionary)
                arrayBrands.append(loadedData)
            }
            return arrayBrands
        }
        return nil
    }
    
    
    func getBrands(completion: @escaping ([Brand]?, Bool) -> Void) {
        apiManager.request(url: "\(baseUrl)/carros/marcas") { (response) in
            if let arrayBrands = self.parseData(response: response) {
                completion(arrayBrands, true)
                return
            }
            completion(nil, false)
        }
    }
}
