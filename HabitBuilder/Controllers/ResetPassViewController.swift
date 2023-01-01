//
//  ResetPassViewController.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 06.12.22.
//

import UIKit

class ResetPassViewController: MainVC {
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var coursesBtn: UIButton!
    @IBOutlet weak var communityBtn: UIButton!
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var homeContainer: UIView!
    @IBOutlet weak var plusButtonImage: UIImageView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeBtn.setTitle("", for: .normal)
        coursesBtn.setTitle("", for: .normal)
        communityBtn.setTitle("", for: .normal)
        settingsBtn.setTitle("", for: .normal)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
        plusButtonImage.isUserInteractionEnabled = true
        plusButtonImage.addGestureRecognizer(tap)
        
        plusButtonImage.clipsToBounds = false
        plusButtonImage.layer.shadowRadius = 30
        plusButtonImage.layer.shadowOpacity = 0.75
        plusButtonImage.layer.shadowOffset = CGSize(width: 0, height: 20)
        plusButtonImage.layer.shadowColor = UIColor(red: 0.817, green: 0.495, blue: 0.197, alpha: 1).cgColor
    }
    
    @IBAction func homeAct(_ sender: Any) {
        
        if let nav = appDelegate.activeVC.navigationController {
            let navStack = nav.children
            
            if appDelegate.activeVC is HomeViewController { return } else {
                for vc in navStack {
                    if vc is HomeViewController {
                        DispatchQueue.main.async {
                            nav.popToViewController(vc, animated: true)
                        }
                        return
                    }
                }
                
                if let homeVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "HomeViewController") as? HomeViewController {
                    DispatchQueue.main.async {
                        nav.pushViewController(homeVC, animated: true)
                    }
                    return
                }
            }
        }
    }
    
    @IBAction func coursesAct(_ sender: Any) {
        if let nav = appDelegate.activeVC.navigationController {
            let navStack = nav.children
            
            if appDelegate.activeVC is CoursesViewController { return } else {
                for vc in navStack {
                    if vc is CoursesViewController {
                        DispatchQueue.main.async {
                            nav.popToViewController(vc, animated: true)
                        }
                        return
                    }
                }
                
                if let coursesVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "CoursesViewController") as? CoursesViewController {
                    DispatchQueue.main.async {
                        nav.pushViewController(coursesVC, animated: true)
                    }
                    return
                }
            }
        }
    }
    
    @IBAction func communityAct(_ sender: Any) {
        if let nav = appDelegate.activeVC.navigationController {
            let navStack = nav.children
            
            if appDelegate.activeVC is CommunityViewController { return } else {
                for vc in navStack {
                    if vc is CommunityViewController {
                        DispatchQueue.main.async {
                            nav.popToViewController(vc, animated: true)
                        }
                        return
                    }
                }
                
                if let communityVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "CommunityViewController") as? CommunityViewController {
                    DispatchQueue.main.async {
                        nav.pushViewController(communityVC, animated: true)
                    }
                    return
                }
            }
        }
    }
    
    @IBAction func settingAct(_ sender: Any) {
        if let nav = appDelegate.activeVC.navigationController {
            let navStack = nav.children
            
            if appDelegate.activeVC is SettingsViewController { return } else {
                for vc in navStack {
                    if vc is SettingsViewController {
                        DispatchQueue.main.async {
                            nav.popToViewController(vc, animated: true)
                        }
                        return
                    }
                }
                
                if let settingVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "SettingsViewController") as? SettingsViewController {
                    DispatchQueue.main.async {
                        nav.pushViewController(settingVC, animated: true)
                    }
                    return
                }
            }
        }
    }
    
    @objc func buttonTapped() {
        print("button tapped")
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        show(vc, sender: nil)
    }
    
    
    
}
