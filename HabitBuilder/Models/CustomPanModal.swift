//
//  CustomPanModal.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 09.12.22.
//

import UIKit

class CustomPanModal: UIView {
    
    private var bgView: UIView!
    private var closeVIew: UIView!
    private var closeButton: UIButton!
    private var imageView: UIImage!
    private var titleLabel: UILabel!
    private var descriptionLabel: UILabel!
    private var topButton: UIButton!
    private  var downButton: UIButton!
    
    override func draw(_ rect: CGRect) {
        
        setupBgView()
        setupCloseView()
        setupCloseButton()
    }
    
    func setupBgView() {
        bgView = UIView()
        
        bgView.backgroundColor = .white
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 12
        
        self.addSubview(bgView)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: bgView!, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView!, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView!, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView!, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
    }
    
    func setupCloseView() {
        closeVIew = UIView()
        
        closeVIew.backgroundColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 0.1)
        closeVIew.layer.cornerRadius = 16
        
        bgView.addSubview(closeVIew)
        closeVIew.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: closeVIew!, attribute: .top, relatedBy: .equal, toItem: bgView, attribute: .top, multiplier: 1, constant: 12).isActive = true
        NSLayoutConstraint(item: closeVIew!, attribute: .trailing, relatedBy: .equal, toItem: bgView, attribute: .trailing, multiplier: 1, constant: -12).isActive = true
        NSLayoutConstraint(item: closeVIew!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 32).isActive = true
        NSLayoutConstraint(item: closeVIew!, attribute: .width, relatedBy: .equal, toItem: closeVIew, attribute: .height, multiplier: 1, constant: 0).isActive = true
    }
    
    func setupCloseButton() {
        closeButton = UIButton()
        
        closeButton.setTitle("", for: .normal)
        closeButton.setImage(UIImage(named: "close_button"), for: .normal)
        
        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        
        self.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: closeButton!, attribute: .centerX, relatedBy: .equal, toItem: closeVIew, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: closeButton!, attribute: .centerY, relatedBy: .equal, toItem: closeVIew, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: closeButton!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 8.5).isActive = true
        NSLayoutConstraint(item: closeButton!, attribute: .width, relatedBy: .equal, toItem: closeVIew, attribute: .height, multiplier: 1, constant: 0).isActive = true
    }
    
    @objc func didTapCloseButton(_ sender: Any) {
        print("button clicked")
    }
    
    
}
