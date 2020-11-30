//
//  TableViewDelegateDataSource.swift
//  1130_MvvmFipe
//
//  Created by Jorge Roberto on 30/11/20.
//

import Foundation

import UIKit

class TableViewDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel: ViewModelProtocol!
    
    init(viewModel: ViewModelProtocol){
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = viewModel.getTitleForCell(at: indexPath.row)
        return cell
    }

    
}
