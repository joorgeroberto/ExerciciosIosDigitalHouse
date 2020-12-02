//
//  TableViewDelegateDataSource.swift
//  1202_Sqlite
//
//  Created by Jorge Roberto on 02/12/20.
//
import Foundation
import UIKit

class TableViewDelegateDataSource: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel: ViewModelProtocol!
    var viewController: UIViewController?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = viewModel.getAlert(tableView: tableView, indexPath: indexPath)
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.getCell(tableView: tableView, indexPath: indexPath)
    }

    
}

