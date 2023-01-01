//
//  CustomTopBar.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 08.12.22.
//

import UIKit

@IBDesignable
class CustomTopBar: UIView {
    
    private var bgView: UIView!
    private var stackView: UIStackView!
    private var profileImageView: UIImageView!
    private var leftImageView: UIImageView!
    private var label: UILabel!
    private var rightButton: UIButton!
    private var leftButton: UIButton!
    
    @IBInspectable
    public var isRightBtn: Bool = false
    
    @IBInspectable
    var profileImageName: String = "" {
        didSet {
            if profileImageView != nil {
                profileImageView.image = UIImage(named: profileImageName)
            }
        }
    }
    
    @IBInspectable
    var leftImageName: String = "" {
        didSet {
            if leftImageView != nil {
                leftImageView.image = UIImage(named: leftImageName)
            }
        }
    }
    
    @IBInspectable
    var title: String = "Title" {
        didSet {
            if label != nil {
                label.text = title
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        setupBgView()
        setupRightImageView()
        setupLeftImageView()
        setupLabel()
        setupRightButton()
        setupLeftButton()
    }
    
    func setupBgView() {
        bgView = UIView()
        
        bgView.clipsToBounds = true
        
        self.addSubview(bgView)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: bgView!, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView!, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView!, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView!, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
    }
    
    func setupRightImageView() {
        profileImageView = UIImageView()
        
        if isRightBtn == true {
            profileImageView.isHidden = true
        }
        
        profileImageView.image = UIImage(named: profileImageName)
        profileImageView.contentMode = .scaleAspectFit
        
        bgView.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: profileImageView!, attribute: .trailing, relatedBy: .equal, toItem: bgView, attribute: .trailing, multiplier: 1, constant: -20).isActive = true
        NSLayoutConstraint(item: profileImageView!, attribute: .centerY, relatedBy: .equal, toItem: bgView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: profileImageView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 44).isActive = true
        NSLayoutConstraint(item: profileImageView!, attribute: .width, relatedBy: .equal, toItem: profileImageView, attribute: .height, multiplier: 1, constant: 0).isActive = true
    }
    
    func setupLeftImageView() {
        leftImageView = UIImageView()
        
        leftImageView.image = UIImage(named: leftImageName)
        leftImageView.contentMode = .scaleAspectFit
        
        bgView.addSubview(leftImageView)
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: leftImageView!, attribute: .leading, relatedBy: .equal, toItem: bgView, attribute: .leading, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: leftImageView!, attribute: .centerY, relatedBy: .equal, toItem: bgView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: leftImageView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 44).isActive = true
        NSLayoutConstraint(item: leftImageView!, attribute: .width, relatedBy: .equal, toItem: leftImageView, attribute: .height, multiplier: 1, constant: 0).isActive = true
    }
    
    func setupLabel() {
        label = UILabel()
        label.text = title
        label.textAlignment = .center
        
        bgView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: label!, attribute: .centerX, relatedBy: .equal, toItem: bgView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: label!, attribute: .centerY, relatedBy: .equal, toItem: bgView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: label!, attribute: .trailing, relatedBy: .equal, toItem: profileImageView, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: label!, attribute: .leading, relatedBy: .equal, toItem: leftImageView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
    }
    
    func setupRightButton() {
        rightButton = UIButton()
        rightButton.setTitle("", for: .normal)
        rightButton.addTarget(self, action: #selector(tappedProfileBtn), for: .touchUpInside)
        
        self.addSubview(rightButton)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: rightButton!, attribute: .centerX, relatedBy: .equal, toItem: profileImageView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: rightButton!, attribute: .centerY, relatedBy: .equal, toItem: profileImageView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: rightButton!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 44).isActive = true
        NSLayoutConstraint(item: rightButton!, attribute: .width, relatedBy: .equal, toItem: rightButton, attribute: .height, multiplier: 1, constant: 0).isActive = true
    }
    
    func setupLeftButton() {
        leftButton = UIButton()
        leftButton.setTitle("", for: .normal)
        leftButton.addTarget(self, action: #selector(tappedLeftButton), for: .touchUpInside)
        
        self.addSubview(leftButton)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: leftButton!, attribute: .centerX, relatedBy: .equal, toItem: leftImageView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: leftButton!, attribute: .centerY, relatedBy: .equal, toItem: leftImageView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: leftButton!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 44).isActive = true
        NSLayoutConstraint(item: leftButton!, attribute: .width, relatedBy: .equal, toItem: leftButton, attribute: .height, multiplier: 1, constant: 0).isActive = true
    }
    
    @objc func tappedProfileBtn(_ sender: Any) {
        print("button tapped")
    }
    
    @objc func tappedLeftButton(_ sender: Any) {
        print("button tapped")
    }
}
