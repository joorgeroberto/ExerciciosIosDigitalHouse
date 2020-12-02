//
//  ViewModelProtocol.swift
//  1202_Sqlite
//
//  Created by Jorge Roberto on 02/12/20.
//

import Foundation
import UIKit

protocol ViewModelProtocol {
    /// Carrega os dados
    func loadData(onComplete: @escaping (_ success: Bool) -> Void)
    
    /// Retorna o número de células (count do array)
    func getNumberOfRows() -> Int
    
    func getAlert(tableView: UITableView, indexPath: IndexPath) -> UIAlertController
    
    func getCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    
    /// Retorna o texto a ser exibido na cell
    func getTitleForCell(at index: Int) -> String
    
    /// Retorna o título para exibir na navigationDefaultList
    func getViewTitle() -> String
}

