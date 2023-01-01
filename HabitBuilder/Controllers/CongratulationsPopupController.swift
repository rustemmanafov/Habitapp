//
//  CongratulationsPopupController.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 14.12.22.
//

import UIKit

class CongratulationsPopupController: MainVC {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var closeView: UIView!
    @IBOutlet weak var closeBtnImage: UIImageView!
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var congratLabel: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var createBtnView: CustomButton!
    @IBOutlet weak var continueBtnView: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 15
        closeView.layer.backgroundColor = UIColor.white.cgColor
        
        let tapImg = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        closeBtnImage.isUserInteractionEnabled = true
        closeBtnImage.addGestureRecognizer(tapImg)
        
        let tapImg1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped1(tapGestureRecognizer:)))
        createBtnView.isUserInteractionEnabled = true
        createBtnView.addGestureRecognizer(tapImg1)
        
        let tapImg2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped2(tapGestureRecognizer:)))
        continueBtnView.isUserInteractionEnabled = true
        continueBtnView.addGestureRecognizer(tapImg2)
        
        congratLabel.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        descriptionLbl.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
                
        self.view.backgroundColor = .black.withAlphaComponent(0)
        
        self.mainView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.size.height * 0.75)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        inAnimation()
    }
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let _ = tapGestureRecognizer.view as! UIImageView
        
        print("button tapped")
        
        outAnimation()
    }
    
    @objc func imageTapped1(tapGestureRecognizer: UITapGestureRecognizer) {
        let _ = tapGestureRecognizer.view as! UIImageView
        
        print("button tapped")
    }
    
    @objc func imageTapped2(tapGestureRecognizer: UITapGestureRecognizer) {
        let _ = tapGestureRecognizer.view as! UIImageView
        
        print("button tapped")
    }
    
    func inAnimation() {
        UIView.animate(withDuration: 3, delay: 0, options: .curveEaseIn) {
            self.view.backgroundColor = .black.withAlphaComponent(0.5)
            self.mainView.transform = CGAffineTransform(translationX: 0, y: 0)


        } completion: { _ in
            
        }
    }
    
    func outAnimation() {
        UIView.animate(withDuration: 3, delay: 0, options: .curveEaseOut) {
            self.view.backgroundColor = .black.withAlphaComponent(0)
            self.mainView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.size.height * 0.75)

        } completion: { _ in
            self.dismiss(animated: false)
        }
    }
}
