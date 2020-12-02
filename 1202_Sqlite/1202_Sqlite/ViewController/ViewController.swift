//
//  ViewController.swift
//  1202_Sqlite
//
//  Created by Jorge Roberto on 02/12/20.
//

import UIKit
import Alamofire
import NAMDatabase

class ViewController: UIViewController {
    var viewModel: ViewModelProtocol!
    @IBOutlet weak var tableView: UITableView!
    var tableViewDelegateDataSource: TableViewDelegateDataSource?
    var arrayBrands = [Brand]()
    var favorite = Favorite()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    func loadData() {
        viewModel.loadData(onComplete: { (success) in
            print(success)
            self.configureTableView()
        })
    }
    
    static func getView(viewModel: ViewModelProtocol) -> ViewController {
        let viewDefault = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
        viewDefault.viewModel = viewModel
        return viewDefault
    }
    
    func configureTableView() {
        self.tableViewDelegateDataSource = TableViewDelegateDataSource()
        self.tableViewDelegateDataSource!.viewModel = self.viewModel
        self.tableViewDelegateDataSource!.viewController = self
        self.tableView.delegate = tableViewDelegateDataSource
        self.tableView.dataSource = tableViewDelegateDataSource
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}
