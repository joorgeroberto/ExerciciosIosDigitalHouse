//
//  ViewController.swift
//  0930_DesafioCollectionView_Nomes
//
//  Created by Jorge Roberto on 05/10/20.
//
//  04 - Criar um app:
//  - Tenha uma collectionview com 20 nomes na horizontal; - OK!
//  - Cada célula deve ter um nome numa label, e o background da celula ser cinza fraco; - OK!
//  - Ao tocar na celula, reve remover ela da collectionview, do array e recarregar.

import UIKit

class ViewController: UIViewController {
    var arrayNames = ["Jorge", "Jéssica", "Narlei", "José", "Maria",
                      "Marcela", "Gustavo", "Jânio", "Maísa", "Natany",
                      "Guilherme", "Geyci", "Juliana", "Roberto", "César",
                      "Leia", "Luke", "Vitória", "Rafael", "Ítalo"]
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(arrayNames[indexPath.row])
        arrayNames.remove(at: indexPath.row)
        collectionView.reloadData()
        
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NameCollectionViewCell", for: indexPath) as! NameCollectionViewCell
        cell.setup(name: arrayNames[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, canEditItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}

