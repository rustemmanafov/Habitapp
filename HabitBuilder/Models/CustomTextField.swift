//
//  CustomTextField.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 02.12.22.
//

import UIKit

@IBDesignable
class CustomTextField: UIView, UITextFieldDelegate {
    
    @IBInspectable
    public var placeholderText: String = ""
    
    @IBInspectable
    public var isPassword: Bool = false
    
    @IBInspectable
    public var imageName: String = ""
    
    @IBInspectable
    public var backroundView: UIColor = UIColor()
    
    private var bgView: UIView!
    private var leftSquareView: UIView!
    private var imageView: UIImageView!
    private var lineView: UIView!
    private var stackView: UIStackView!
    private var textField: UITextField!
    private var button: UIButton!
    
    override func draw(_ rect: CGRect) {
        createBackgroundView()
        setupBackgroundView()
        
        createLeftSquareView()
        setupLeftSquareView()
        
        createImageView()
        setupImageView()
        
        createLineView()
        createStackView()
        
        setupLineView()
        setupStackView()
        
        createTextField()
        createButton()
        setupButton()
    }
    
    func createBackgroundView() {
        bgView = UIView()
        bgView.backgroundColor = backgroundColor
        //UIColor(red: 1.00, green: 0.96, blue: 0.93, alpha: 1.00)
        bgView.layer.cornerRadius = 12
        bgView.clipsToBounds = true
        
        self.addSubview(bgView)
    }
    
    func setupBackgroundView() {
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: bgView!, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView!, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView!, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bgView!, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    }
    
    func createLeftSquareView() {
        leftSquareView = UIView()
        
        bgView.addSubview(leftSquareView)
    }
    
    func setupLeftSquareView() {
        leftSquareView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: leftSquareView!, attribute: .top, relatedBy: .equal, toItem: bgView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: leftSquareView!, attribute: .leading, relatedBy: .equal, toItem: bgView, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: leftSquareView!, attribute: .bottom, relatedBy: .equal, toItem: bgView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: leftSquareView!, attribute: .width, relatedBy: .equal, toItem: leftSquareView, attribute: .height, multiplier: 1, constant: 0).isActive = true
    }
    
    func createImageView() {
        imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        imageView.setImageColor(color: UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00))
        
        leftSquareView.addSubview(imageView)
    }
    
    func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: imageView!, attribute: .width, relatedBy: .equal, toItem: imageView, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView!, attribute: .width, relatedBy: .equal, toItem: leftSquareView, attribute: .width, multiplier: 0.4, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView!, attribute: .centerX, relatedBy: .equal, toItem: leftSquareView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView!, attribute: .centerY, relatedBy: .equal, toItem: leftSquareView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    }
    
    func createLineView() {
        lineView = UIView()
        lineView.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.91, alpha: 1.00)
        
        bgView.addSubview(lineView)
    }
    
    func setupLineView() {
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: lineView!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint(item: lineView!, attribute: .top, relatedBy: .equal, toItem: bgView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: lineView!, attribute: .bottom, relatedBy: .equal, toItem: bgView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: lineView!, attribute: .leading, relatedBy: .equal, toItem: leftSquareView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
    }
    
    func createStackView() {
        stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.axis = .horizontal
        
        bgView.addSubview(stackView)
    }
    
    func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: stackView!, attribute: .top, relatedBy: .equal, toItem: bgView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: stackView!, attribute: .bottom, relatedBy: .equal, toItem: bgView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: stackView!, attribute: .leading, relatedBy: .equal, toItem: lineView, attribute: .trailing, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: stackView!, attribute: .trailing, relatedBy: .equal, toItem: bgView, attribute: .trailing, multiplier: 1, constant: -12).isActive = true
    }
    
    func createTextField() {
        textField = UITextField()
        textField.delegate = self
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .orange
        textField.placeholder = placeholderText
        textField.clipsToBounds = true
        // Setup Later
        
        stackView.addArrangedSubview(textField)
    }
    
    func createButton() {
        button = UIButton()
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.setTitle("Show", for: .normal)
        button.setTitleColor(UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        stackView.addArrangedSubview(button)
    }
    
    func setupButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: button!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 44).isActive = true
        
        if isPassword {
            button.isHidden = false
            textField.isSecureTextEntry = true
        } else {
            button.isHidden = true
            textField.isSecureTextEntry = false
        }
    }
    
    @objc func buttonAction(_ sender: Any) {
        textField.isSecureTextEntry.toggle()
    }
    
    // TEXTFIELD DELEGATE
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        imageView.tintColor = .orange
        textField.textColor = .orange
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        imageView.tintColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        textField.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
    }
}

extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
