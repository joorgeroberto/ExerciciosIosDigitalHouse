//
//  APIManager.swift
//  1130_MvvmFipe
//
//  Created by Jorge Roberto on 30/11/20.
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
