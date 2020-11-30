//
//  DefaultListViewController.swift
//  1130_MvvmFipe
//
//  Created by Jorge Roberto on 30/11/20.
//

import UIKit

//Primeiro listar as marcas: https://parallelum.com.br/fipe/api/v1/carros/marcas
//Dai listar os Modelos da marca selecionada: https://parallelum.com.br/fipe/api/v1/carros/marcas/21/modelos
//Quando selecionar um modelo, tem que escolher o ano: https://parallelum.com.br/fipe/api/v1/carros/marcas/21/modelos/437/anos
//Quando escolher o ano, finalmente vai poder exibir as informações do veículo: https://parallelum.com.br/fipe/api/v1/carros/marcas/21/modelos/437/anos/1987-1
//https://veiculos.fipe.org.br/

class DefaultListViewController: UIViewController {
    
    var viewModel: ViewModelProtocol!
    var tableViewDelegateDataSource: TableViewDelegateDataSource?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.getViewTitle()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        viewModel.loadData(onComplete: { (success) in
            print(success)
            self.configureTableView()
        })
    }
    
    static func getView(viewModel: ViewModelProtocol) -> DefaultListViewController {
        let viewDefault = UIStoryboard(name: "DefaultList", bundle: nil).instantiateInitialViewController() as! DefaultListViewController
        viewDefault.viewModel = viewModel
        return viewDefault
    }
    
    func configureTableView() {
        self.tableViewDelegateDataSource = TableViewDelegateDataSource(viewModel: self.viewModel)
        self.tableView.delegate = tableViewDelegateDataSource
        self.tableView.dataSource = tableViewDelegateDataSource
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}
