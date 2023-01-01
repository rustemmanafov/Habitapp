//
//  CustomButton.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 30.11.22.
//

import UIKit

@IBDesignable
class CustomButton: UIView {
    
    var label: UILabel!
    
    var buttonCallback: (() -> ())?
    
    @IBInspectable
    var title: String = "Button" {
        didSet {
            if label != nil {
                label.text = title
            }
        }
    }
    
    @IBInspectable
    var isLightButton: Bool = false
    
    override func draw(_ rect: CGRect) {
        setupButton()
    }
    
    private func setupButton() {
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        
        let bgView = UIView()
        
        if !isLightButton {
            bgView.backgroundColor = UIColor(red: 0.99, green: 0.65, blue: 0.35, alpha: 1.00)
        } else {
            bgView.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.91, alpha: 1.00)
        }
        
        self.addSubview(bgView)
        
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: bgView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
        
        label = UILabel()
        label.text = title
        label.font = UIFont(name: "Manrope-Bold", size: 16)
        label.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.backgroundColor = .clear
        
        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: label!, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: label!, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: label!, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: label!, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
        
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("", for: .normal)
        
        button.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchUpOutside), for: .touchUpOutside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
        
        self.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
    }
    
    @objc func touchUpInside(_ sender: Any) {
        print("touchUpInside")
        buttonCallback?()
    }
    
    @objc func touchUpOutside(_ sender: Any) {
        print("touchUpOutside")
    }
    
    @objc func touchDown(_ sender: Any) {
        print("touchDown")
    }
    
}
