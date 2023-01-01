//
//  CustomGoogleButton.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 01.12.22.
//

import UIKit

@IBDesignable
class CustomGoogleButton: UIView {
    
    private var label: UILabel!
    private var imageView: UIImageView!
    private var stackView: UIStackView!
    
    var googleBtnCallBack: (() -> ())?
    
    @IBInspectable
    var imageName: String = "" {
        didSet {
            if imageView != nil {
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    @IBInspectable
    var title: String = "Button" {
        didSet {
            if label != nil {
                label.text = title
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        setupButton()
    }
    
    private func setupButton() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
        
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        
        createBackgroundView()
        createStackview()
        createImageView()
        createLabel()
        createButton()
    }
    
    private func createBackgroundView() {
        let bgView = UIView()
        bgView.backgroundColor = .white
        
        self.addSubview(bgView)
        
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: bgView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
    }
    
    private func createStackview() {
        stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.backgroundColor = .clear
        stackView.distribution = .equalCentering
        stackView.spacing = 29
        
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: stackView!, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: stackView!, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: stackView!, attribute: .width, relatedBy: .lessThanOrEqual, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: stackView!, attribute: .height, relatedBy: .lessThanOrEqual, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
    }
    
    private func createImageView() {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: imageName)
        imageView.backgroundColor = .clear
        
        stackView.addArrangedSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: imageView!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: imageView!, attribute: .height, relatedBy: .equal, toItem: imageView!, attribute: .width, multiplier: 1, constant: 0).isActive = true
    }
    
    private func createLabel() {
        label = UILabel()
        label.text = title
        label.font = UIFont(name: "Manrope-Medium", size: 16)
        label.textColor = UIColor(red: 0.341, green: 0.2, blue: 0.325, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.backgroundColor = .clear
    
        stackView.addArrangedSubview(label)
    }
    
    private func createButton() {
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
    
    @objc private func touchUpInside(_ sender: Any) {
        print("touchUpInside")
        googleBtnCallBack?()
    }
    
    @objc private func touchUpOutside(_ sender: Any) {
        print("touchUpOutside")
    }
    
    @objc private func touchDown(_ sender: Any) {
        print("touchDown")
    }
}
