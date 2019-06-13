//
//  ViewController.swift
//  PoC.BlurAnimationEffect
//
//  Created by Leandro Romano on 13/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var addItemView: UIView!
    @IBOutlet private weak var visualEffectView: UIVisualEffectView!
    
    private var effect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        addItemView.layer.cornerRadius = 5
    }
    
    private func animateIn() {
        self.view.addSubview(addItemView)
        addItemView.center = self.view.center
        
        addItemView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        addItemView.alpha = 0.0
        
        UIView.animate(withDuration: 0.25) {
            self.visualEffectView.effect = self.effect
            self.addItemView.alpha = 1.0
            self.addItemView.transform = CGAffineTransform.identity
        }
    }
    
    private func animateOut() {
        UIView.animate(withDuration: 0.25, animations: {
            self.addItemView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.addItemView.alpha = 0.0
            self.visualEffectView.effect = nil
        }) { _ in
            self.addItemView.removeFromSuperview()
        }
    }

    @IBAction func addItemAct(_ sender: UIBarButtonItem) {
        self.animateIn()
    }
    
    @IBAction func closePopupViewAct(_ sender: UIButton) {
        self.animateOut()
    }
    
}

