//
//  DefaultListViewController.swift
//  1120_DesafioMvc
//
//  Created by Jorge Roberto on 20/11/20.
//

import UIKit

class DefaultListViewController: UIViewController {
    var controller: ControllerProtocol!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        title = controller.getViewTitle()
        loadData()
    }

    func loadData() {
        controller.loadData { success in
            self.tableView.reloadData()
        }
    }
    
    static func getView(controller: ControllerProtocol) -> DefaultListViewController {
        let viewDefault = UIStoryboard(name: "DefaultList", bundle: nil).instantiateInitialViewController() as! DefaultListViewController
        viewDefault.controller = controller
        return viewDefault
    }
}

extension DefaultListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = controller.getNextController(index: indexPath.row)
        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension DefaultListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = controller.getTitleForCell(at: indexPath.row)
        return cell
    }
    
    
}
