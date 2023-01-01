//
//  CustomAddButton.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 07.12.22.
//

import UIKit

@IBDesignable
class CustomAddButton: UIView {
    
    private var bgView: UIView!
    private var view: UIView!
    private var button: UIButton!
    
    override func draw(_ rect: CGRect) {
        
        createBG()
        createView()
        createButton()
    }
    
    func createBG() {
        bgView = UIView()
        
        bgView.clipsToBounds = false
        bgView.layer.cornerRadius = 30
        bgView.backgroundColor = UIColor(red: 0.99, green: 0.62, blue: 0.27, alpha: 1.00)
        bgView.layer.borderWidth = 8
        bgView.layer.borderColor = UIColor(red: 0.99, green: 0.62, blue: 0.27, alpha: 0.5).cgColor
        
        self.addSubview(bgView)
        
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: bgView!, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView!, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 60).isActive = true
        NSLayoutConstraint(item: bgView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
    }
    
    func createView() {
        view = UIView()
        view.backgroundColor = .clear
        
        view.translatesAutoresizingMaskIntoConstraints = false
        bgView.addSubview(view)
        
        NSLayoutConstraint(item: view!, attribute: .centerX, relatedBy: .equal, toItem: bgView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view!, attribute: .centerY, relatedBy: .equal, toItem: bgView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 18.4).isActive = true
        NSLayoutConstraint(item: view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 18.4).isActive = true
    }
    
    func createButton() {
        button = UIButton()
        
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "plus_icon"), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint(item: button!, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: button!, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: button!, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 18.4).isActive = true
        NSLayoutConstraint(item: button!, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 18.4).isActive = true
    }
    
    @objc func buttonPressed(_ sender: Any) {
        print("button tapped")
    }
}
