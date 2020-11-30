//
//  BrandViewModel.swift
//  1130_MvvmFipe
//
//  Created by Jorge Roberto on 30/11/20.
//

import Foundation
import UIKit

class BrandViewModel: ViewModelProtocol {
    let fipeAPI = FipeAPI()
    var arrayBrands: [BaseClass]?
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        fipeAPI.getBrands { (arrayBrands, success) in
            self.arrayBrands = arrayBrands
            onComplete(success)
        }
    }
    
    func getNumberOfRows() -> Int {
        return arrayBrands?.count ?? 0
    }
    
    func getNextController(index: Int) -> UIViewController {
        //let viewModel = CarModelViewModel(brand: arrayBrands[index])
        let viewModel = BrandViewModel()
        return DefaultListViewController.getView(viewModel: viewModel)
    }
    
    func getTitleForCell(at index: Int) -> String {
        return arrayBrands![index].name
    }
    
    func getViewTitle() -> String {
        return "Marcas"
    }
}
