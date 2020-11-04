//
//  ViewController.swift
//  1030_iBuy
//
//  Created by Jorge Roberto on 30/10/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    
    var listManager = ListsManager(open: [Item](), completed: [Item]())
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
        
        listManager.insert(item: Item(name: "Morango"), list: 0)
        listManager.insert(item: Item(name: "Cebola"), list: 1)
        
        listTableView.reloadData()
    }


}
extension ViewController: UITableViewDelegate{
    
}
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Aberto"
        }
        return "Completo"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return listManager.getList(list: 0).count
        }
        return listManager.getList(list: 1).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! TableViewCell
        //cell.setup(item: listManager.getList(list: 0)[indexPath.row])
        if indexPath.section == 0 {
            cell.setup(item: listManager.getList(list: 0)[indexPath.row])
        } else {
            cell.setup(item: listManager.getList(list: 1)[indexPath.row])
        }
        return cell
    }
    
    
}

