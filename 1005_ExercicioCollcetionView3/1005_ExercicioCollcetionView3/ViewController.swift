//
//  ViewController.swift
//  1005_ExercicioCollcetionView3
//
//  Created by Jorge Roberto on 05/10/20.
//

import UIKit

class ViewController: UIViewController {

    var arrayCars = [Car]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        arrayCars.append(Car(name: "Carro", image: "jorge.jpeg"))
        arrayCars.append(Car(name: "Carro", image: "jorge.jpeg"))
        arrayCars.append(Car(name: "Carro", image: "jorge.jpeg"))
        arrayCars.append(Car(name: "Carro", image: "jorge.jpeg"))
        arrayCars.append(Car(name: "Carro", image: "jorge.jpeg"))
        arrayCars.append(Car(name: "Carro", image: "jorge.jpeg"))
        arrayCars.append(Car(name: "Carro", image: "jorge.jpeg"))
        arrayCars.append(Car(name: "Carro", image: "jorge.jpeg"))
        arrayCars.append(Car(name: "Carro", image: "jorge.jpeg"))
        arrayCars.append(Car(name: "Carro", image: "jorge.jpeg"))
    }


}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewDetail = UIStoryboard(name: "CarDetail", bundle: nil).instantiateInitialViewController() as? CarDetailViewController {
            viewDetail.car = arrayCars[indexPath.row]
            navigationController?.pushViewController(viewDetail, animated: true)
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayCars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCollectionViewCell", for: indexPath) as! CarCollectionViewCell
        cell.setup(car: arrayCars[indexPath.row])
        return cell
    }
}

