//
//  ViewController.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 29.11.22.
//

import UIKit

class InitialVC: MainVC {
    
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animation()
    }
    
    func animation() {
        welcomeLbl.alpha = 0
        
        UIView.animate(withDuration: 3, delay: 2) {
            self.welcomeLbl.alpha = 1
        } completion: { _ in
            self.perform(#selector(self.goToNextView), with: nil, afterDelay: 2)
        }
    }
    
    @objc func goToNextView() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnboardingVC") as! OnboardingVC
        vc.modalPresentationStyle = .fullScreen
        self.show(vc, sender: nil)
    }
    
    func setupUI() {
        imageView.image = UIImage(named: "SplashScreen")
        welcomeLbl.text = "WELCOME TO MONUMENTAL HABITS"
        welcomeLbl.textColor = UIColor(red: 0.341, green: 0.2, blue: 0.325, alpha: 1)
        welcomeLbl.font = UIFont(name: "Klasik-Regular", size: 40)
    }
}

