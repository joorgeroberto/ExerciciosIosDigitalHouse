//
//  ViewController.swift
//  1111_ExercicioApi
//
//  Created by Jorge Roberto on 11/11/20.
//

import UIKit
import Alamofire
import NAMDatabase

class ViewController: UIViewController {
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var resultTextField: UILabel!
    var BRLValue: Double = 0
    var USDValue: Double = 0
    var type: String = "USD"
    @IBAction func convertButtonAction(_ sender: Any) {
        if !valueTextField.text!.isEmpty {
            if(type == "USD"){
                resultTextField.text = "R$ \(Double(valueTextField.text!)! * Double(BRLValue))"
            } else {
                resultTextField.text = "U$ \(Double(valueTextField.text!)! * Double(USDValue))"
            }
        }
    }
    @IBAction func usdToBrlButtonAction(_ sender: Any) {
        valueTextField.placeholder = "USD to BRL"
        self.type = "USD"
        convertData()
    }
    @IBAction func brlToUsdButtonAction(_ sender: Any) {
        valueTextField.placeholder = "BRL to USD"
        self.type = "BRL"
        convertData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        valueTextField.placeholder = "USD to BRL"
        convertData()
    }

    func convertData() {
        var secondType: String = "BRL"
        if(type == "USD") { secondType =  "BRL" }
        if(type == "BRL"){ secondType =  "USD" }
        AF.request("https://api.exchangeratesapi.io/latest?symbols=\(type),\(secondType)&base=\(type)").responseJSON {
            response in if let dictionary = response.value as? [String: Any] {
                let convertValue = ConvertManager(fromDictionary: dictionary)
                self.BRLValue = convertValue.rates.bRL!
                self.USDValue = convertValue.rates.uSD!
                self.resultTextField!.text = ""
            }
        }
    }
}
