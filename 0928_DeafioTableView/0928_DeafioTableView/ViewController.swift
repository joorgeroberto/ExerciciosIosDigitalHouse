//
//  ViewController.swift
//  0928_DeafioTableView
//
//  Created by Jorge Roberto on 28/09/20.
//

import UIKit

class ViewController: UIViewController {

    var arrayNames = [Developer]()
    
    @IBOutlet weak var tableViewList: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewList.delegate = self
        tableViewList.dataSource = self
        
        arrayNames.append(Developer(name: "Jorge", image: "jorge.jpeg"))
        arrayNames.append(Developer(name: "Marcela", image: "msaidel.jpeg"))
        arrayNames.append(Developer(name: "Michel", image: "michel.jpeg"))
        arrayNames.append(Developer(name: "Narlei", image: "narlei.jpeg"))
        arrayNames.append(Developer(name: "Jéssica", image: "jessica.jpeg"))
        
        tableViewList.reloadData()

    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arrayNames[indexPath.row].name)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        arrayNames.remove(at: indexPath.row)
        tableViewList.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MyCustomCell
        cell.setup(developer: arrayNames[indexPath.row], indexPath: indexPath.row)
        return cell
    }
    
    
}

