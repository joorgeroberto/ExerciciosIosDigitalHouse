//
//  ViewController.swift
//  0930_DesafioCollectionView
//
//  Created by Jorge Roberto on 30/09/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var arrayCars = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayCars.append("jessica.jpeg")
        arrayCars.append("jorge.jpeg")
        arrayCars.append("michel.jpeg")
        arrayCars.append("msaidel.jpeg")
        arrayCars.append("narlei.jpeg")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.reloadData()
        
        
    }


}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(arrayCars[indexPath.row])
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayCars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as! CarCollectionViewCell
        cell.setup(imageName: arrayCars[indexPath.row])
        return cell
    }
    
    
}
