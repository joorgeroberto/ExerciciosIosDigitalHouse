//
//  ViewController.swift
//  0930_DesafioCollectionView_Carros
//
//  Created by Jorge Roberto on 04/10/20.
//
//  03 - Criar um app:
//  - Tenha uma collectionview com 10 carros na vertical;
//  - Cada célula deve ter o nome e a imagem do carro; (pode repetir a mesma imagem)
//  - Quando tocar numa celula, deve abrir uma tela via navigation (push), nessa tela deve haver a imagem grande.


import UIKit

class ViewController: UIViewController {
    var arrayCars = [Car]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayCars.append(Car("Fiat 1", "Uno.jpg"))
        arrayCars.append(Car("Bmw 1", "bmw.jpg"))
        arrayCars.append(Car("Ford 1", "ford.jpg"))
        arrayCars.append(Car("Renault 1", "Renault.jpg"))
        arrayCars.append(Car("Fiat 2", "Uno.jpg"))
        
        arrayCars.append(Car("Bmw 2", "bmw.jpg"))
        arrayCars.append(Car("Ford 2", "ford.jpg"))
        arrayCars.append(Car("Renault 2", "Renault.jpg"))
        arrayCars.append(Car("Ford 3", "ford.jpg"))
        arrayCars.append(Car("Renault 3", "Renault.jpg"))
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.reloadData()
    }


}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(arrayCars[indexPath.row].name)
        if let carDetail = UIStoryboard(name: "CarDetail", bundle: nil).instantiateInitialViewController() as? CarDetailViewController {
            navigationController?.pushViewController(carDetail, animated: true)
            carDetail.car = arrayCars[indexPath.row]
        }
        
    }
}



extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return arrayCars.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as! CarCollectionViewCell
            cell.setup(arrayCars[indexPath.row])
            return cell
        }
        
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = (view.frame.width-40)
        return CGSize(width: width, height: width / 2)
    }
}


