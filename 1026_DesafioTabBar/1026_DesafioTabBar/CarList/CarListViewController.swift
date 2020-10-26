//
//  CarListViewController.swift
//  1026_DesafioTabBar
//
//  Created by Jorge Roberto on 26/10/20.
//

import UIKit

class CarListViewController: UIViewController {
    var arrayCars = [Car]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayCars.append(Car(name: "Uno com escadinha", brand: "Fiat"))
        arrayCars.append(Car(name: "Uno da firma", brand: "Fiat"))
        arrayCars.append(Car(name: "Fusca 64", brand: "Wolks"))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //self.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        title = "Car List"
    }

}

extension CarListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let carDetail = UIStoryboard(name: "CarDetail", bundle: nil).instantiateInitialViewController() as? CarDetailViewController {
            carDetail.car = arrayCars[indexPath.row]
            print(arrayCars[indexPath.row].name)
            //present(carDetail, animated: true, completion: nil)
            navigationController?.pushViewController(carDetail, animated: true)
        }
    }
}

extension CarListViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCars.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carTableViewCell") as! CarTableViewCell
        cell.setup(car: arrayCars[indexPath.row])
        return cell
    }
    
    
}
