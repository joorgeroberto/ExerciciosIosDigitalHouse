//
//  ViewModelProtocol.swift
//  1130_MvvmFipe
//
//  Created by Jorge Roberto on 30/11/20.
//

import Foundation
import UIKit

protocol ViewModelProtocol {
    /// Carrega os dados
    func loadData(onComplete: @escaping (_ success: Bool) -> Void)
    
    /// Retorna o número de células (count do array)
    func getNumberOfRows() -> Int
    
    /// Retorna a Controller da próxima view a ser aberta
    func getNextController(index: Int) -> UIViewController
    
    /// Retorna o texto a ser exibido na cell
    func getTitleForCell(at index: Int) -> String
    
    /// Retorna o título para exibir na navigationDefaultList
    func getViewTitle() -> String
}
