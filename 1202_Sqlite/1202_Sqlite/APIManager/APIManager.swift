//
//  APIManager.swift
//  1202_Sqlite
//
//  Created by Jorge Roberto on 02/12/20.
//

import Foundation
import Alamofire

class APIManager {
    
    typealias completion <T> = (_ result: T, _ failure: Bool) -> Void
    
    func request(url: String, onComplete: @escaping (_ response: Any?) -> Void) {
        AF.request(url).responseJSON  { response in
            onComplete(response.value)
        }
    }
}
