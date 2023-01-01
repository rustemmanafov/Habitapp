//
//  LoginViewController.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 30.11.22.
//

import UIKit

class LoginViewController: MainVC {
    
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var customGoogleButton: CustomGoogleButton!
    @IBOutlet weak var bottomImageView: UIView!
    @IBOutlet weak var customFbButton: CustomGoogleButton!
    @IBOutlet weak var lineImage: UIImageView!
    @IBOutlet weak var passwordTxt: CustomTextField!
    @IBOutlet weak var emailTxt: CustomTextField!
    @IBOutlet weak var forgotPassLbl: UILabel!
    @IBOutlet weak var signUpLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "login")
        
        bottomImageView.backgroundColor = .white
        bottomImageView.layer.cornerRadius = 20
        
        infoLbl.text = "WELCOME TO MONUMENTAL HABITS"
        infoLbl.textColor = UIColor(red: 0.341, green: 0.2, blue: 0.325, alpha: 1)
        infoLbl.font = UIFont(name: "Klasik-Regular", size: 32)
        
        lineImage.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.91, alpha: 1.00)
        
        let forgotTap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.forgotFunc))
        forgotPassLbl.isUserInteractionEnabled = true
        forgotPassLbl.addGestureRecognizer(forgotTap)
        
        let signUpTap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.signUpFunc))
        signUpLbl.isUserInteractionEnabled = true
        signUpLbl.addGestureRecognizer(signUpTap)
        
        customGoogleButton.googleBtnCallBack = {
            print("tap working")
        }
        
        customFbButton.googleBtnCallBack = {
            print("tap working")
        }
        
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Forgot Password?", attributes: underlineAttribute)
        forgotPassLbl.attributedText = underlineAttributedString
    }
    
    @objc
    func forgotFunc(sender:UITapGestureRecognizer) {
        print("tap working")
    }
    
    @objc
    func signUpFunc(sender:UITapGestureRecognizer) {
        print("tap working")
        let vc = storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        vc.modalPresentationStyle = .fullScreen
        show(vc, sender: nil)
    }
}
