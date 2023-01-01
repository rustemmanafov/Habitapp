//
//  CustomBtn.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 02.12.22.
//

import UIKit

@IBDesignable
class SimaGreenButton: UIView {
    
    var actionCallback: (() -> Void)?
    
    var titleLabel: UILabel = UILabel()
    var shadowView: UIView!
    var iconImageView: UIImageView!
    var stackView: UIStackView!
    
    let animationTime: TimeInterval = 1 / 32
    let animationScale: CGFloat = 0.97
    
    var shadowOpacity: CGFloat = 0.3
    var shadowRadius: CGFloat = 8
    var shadowOffset: CGSize = CGSize(width: 0, height: 4)
    
    var titleColor: UIColor = .white
    var cornerRadius: CGFloat = 4
    var borderWidth: CGFloat = 0
    var borderColor: UIColor = .clear
    
    var iconSize: CGFloat = 23
    
    //var fillColor: UIColor = simaGreenColor
    
    var hasShadow: Bool = true
    
    var isEnabled: Bool = true { didSet { self.checkEnability() } }
    
    @IBInspectable public var title: String = "" { didSet { self.configureLabel() } }
    
    @IBInspectable public var imageName: String = "" { didSet { self.configureImage() } }
    
    override func draw(_ rect: CGRect) {
        let bgView = UIView()
        //bgView.backgroundColor = fillColor
        addSubview(bgView)
        
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: bgView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        
        stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: stackView!, attribute: .width, relatedBy: .lessThanOrEqual, toItem: self, attribute: .width, multiplier: 0.9, constant: 0).isActive = true
        NSLayoutConstraint(item: stackView!, attribute: .height, relatedBy: .lessThanOrEqual, toItem: self, attribute: .height, multiplier: 0.9, constant: 0).isActive = true
        
        NSLayoutConstraint(item: stackView!, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: stackView!, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
        button.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchUpOutside), for: .touchUpOutside)
        addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        titleLabel.textColor = titleColor
        
        self.checkEnability()
        self.configureImage()
        self.configureLabel()
        
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = cornerRadius > 0
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        
        self.clipsToBounds = true
        
        if hasShadow && shadowView == nil && shadowOpacity > 0 {
            shadowView = UIView(frame: self.frame)
            shadowView.backgroundColor = .clear
            //shadowView.layer.shadowColor = fillColor.cgColor
            shadowView.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
            shadowView.layer.shadowOffset = shadowOffset
            shadowView.layer.shadowOpacity = Float(shadowOpacity)
            shadowView.layer.shadowRadius = shadowRadius
            shadowView.layer.masksToBounds = true
            shadowView.clipsToBounds = false
            
            self.superview?.addSubview(shadowView)
            self.superview?.bringSubviewToFront(self)
        }
        
        super.draw(rect)
    }
    
    func configureLabel() {
        if title != "" {
            titleLabel.text = title
            titleLabel.font = UIFont(name: "Roboto Bold", size: 15)
            titleLabel.textAlignment = .left
            if stackView != nil {
                stackView.addArrangedSubview(titleLabel)
            }
        }
    }
    
    func configureImage() {
        if imageName != "" {
            iconImageView = UIImageView()
            iconImageView.image = UIImage(named: imageName)
            
            if stackView != nil {
                stackView.addArrangedSubview(iconImageView)
                iconImageView.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint(item: iconImageView!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: iconSize).isActive = true
                NSLayoutConstraint(item: iconImageView!, attribute: .height, relatedBy: .equal, toItem: iconImageView, attribute: .height, multiplier: 1, constant: 0).isActive = true
            }
        }
    }
    
    func checkEnability() {
        if isEnabled == false {
            titleLabel.alpha = 0.5
        } else {
            titleLabel.alpha = 1
        }
    }
    
    @objc func touchDown() {
        if isEnabled {
           // animationIn()
        }
    }
    
    @objc func touchUpOutside() {
        if isEnabled {
            //animationOut()
        }
    }
    
    @objc func touchUpInside() {
        if isEnabled {
            //animationOut()
            actionCallback?()
        }
    }
    
//    func animationIn() {
//        Haptico.shared().generateFeedbackFromPattern(".", delay: animationTime)
//
//        UIView.animate(withDuration: animationTime, delay: 0) {
//            self.transform = CGAffineTransform(scaleX: self.animationScale, y: self.animationScale)
//            if self.hasShadow {
//                self.shadowView.transform = CGAffineTransform(scaleX: self.animationScale, y: self.animationScale)
//            }
//        }
//    }
//
//    func animationOut() {
//        Haptico.shared().generateFeedbackFromPattern("o", delay: animationTime)
//
//        UIView.animate(withDuration: animationTime, delay: 0) {
//            self.transform = CGAffineTransform(scaleX: 1, y: 1)
//            if self.hasShadow {
//                self.shadowView.transform = CGAffineTransform(scaleX: 1, y: 1)
//            }
//        }
//    }
}
