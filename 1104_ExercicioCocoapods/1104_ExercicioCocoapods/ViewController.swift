//
//  ViewController.swift
//  1104_ExercicioCocoapods
//
//  Created by Jorge Roberto on 04/11/20.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "https://conteudo.imguol.com.br/c/entretenimento/ba/2018/12/19/cena-do-game-homem-aranha-exclusivo-para-o-playstation-4-1545237822496_v2_1920x1080.png")
        image.kf.setImage(with: url)
    }


}

