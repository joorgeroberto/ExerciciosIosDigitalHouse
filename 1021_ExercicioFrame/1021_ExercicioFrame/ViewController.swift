//
//  ViewController.swift
//  1021_ExercicioFrame
//
//  Created by Jorge Roberto on 21/10/20.
//

import UIKit

class ViewController: UIViewController {
    var positionYInitial = 20
    var positionYCurrent = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }

    @objc func createView() {
        let newView = UIView(frame: CGRect(x: 0, y: positionYCurrent, width: 50, height: 50))
        newView.backgroundColor = .random
        view.addSubview(newView)
        positionYCurrent += 50
        let tap = UITapGestureRecognizer(target: self, action: #selector(createView))
        newView.addGestureRecognizer(tap)
        animateAndRemoveSubviews()
    }
    
    func animateAndRemoveSubviews() {
        if(Float(positionYCurrent) > Float(self.view.frame.size.height)) {
            let animatedView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            animatedView.backgroundColor = .white
            view.addSubview(animatedView)
            animatedView.center = view.center
            
            UIView.animate(withDuration: 2) {
                animatedView.frame = self.view.frame
            } completion: { _ in
                self.positionYCurrent = self.positionYInitial
                self.view.subviews.forEach {
                    $0.removeFromSuperview()
                }
                self.createView()
            }
        }
    }
}

extension UIColor {
  static var random: UIColor {
    return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
  }
}

