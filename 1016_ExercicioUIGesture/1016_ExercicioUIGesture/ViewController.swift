//
//  ViewController.swift
//  1016_ExercicioUIGesture
//
//  Created by Jorge Roberto on 16/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var longPressView: UIView!
    @IBOutlet weak var leftSwipeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(sum))
        tapView.addGestureRecognizer(tap)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(sum))
        longPress.minimumPressDuration = 3
        longPressView.addGestureRecognizer(longPress)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(minus))
        leftSwipe.direction = .left
        leftSwipeView.addGestureRecognizer(leftSwipe)
    }

    @objc func sum() {
        counterLabel.text = "\(Int(counterLabel.text!)! + 1)";
    }
    
    @objc func minus() {
        if(Int(counterLabel.text!)! > 0) {
            counterLabel.text = "\(Int(counterLabel.text!)! - 1)";
        } else {
            counterLabel.text = "0";
        }
    }
}

