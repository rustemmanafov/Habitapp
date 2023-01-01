//
//  SignUpViewController.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 05.12.22.
//

import UIKit

class SignUpViewController: MainVC {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var signedInImg: UIImageView!
    @IBOutlet weak var emailImg: UIImageView!
    @IBOutlet weak var createAccountBtn: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 1, green: 0.965, blue: 0.929, alpha: 1)
        
        titleLabel.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        titleLabel.font = UIFont(name: "Klasik-Regular", size: 24)
        
        nameTextField.backgroundColor = .white
        nameTextField.layer.cornerRadius = 12
        nameTextField.clipsToBounds = true

        emailTextField.backgroundColor = .white
        emailTextField.layer.cornerRadius = 12
        emailTextField.clipsToBounds = true

        passwordTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = 12
        passwordTextField.clipsToBounds = true

        let tapSignUpImg = UITapGestureRecognizer(target: self, action: #selector(imageOneTapped(tapGestureRecognizer:)))
        signedInImg.isUserInteractionEnabled = true
        signedInImg.addGestureRecognizer(tapSignUpImg)
        
        let tapEmailImg = UITapGestureRecognizer(target: self, action: #selector(imageTwoTapped(tapGestureRecognizer:)))
        emailImg.isUserInteractionEnabled = true
        emailImg.addGestureRecognizer(tapEmailImg)
        
        createAccountBtn.buttonCallback = {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CongratulationsPopupController") as! CongratulationsPopupController
            vc.modalPresentationStyle = .overFullScreen
            
            self.present(vc, animated: false)
        }

    }
    
    @objc func imageOneTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let _ = tapGestureRecognizer.view as! UIImageView

        if signedInImg.image == UIImage(named: "rec_empty") {
            signedInImg.image = UIImage(named: "image_tick")
        } else {
            signedInImg.image = UIImage(named: "rec_empty")
        }
    }
    
    @objc func imageTwoTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let _ = tapGestureRecognizer.view as! UIImageView
        
        if emailImg.image == UIImage(named: "rec_empty") {
            emailImg.image = UIImage(named: "image_tick")
        } else {
            emailImg.image = UIImage(named: "rec_empty")
        }
    }
    
 
    
    
   


}
