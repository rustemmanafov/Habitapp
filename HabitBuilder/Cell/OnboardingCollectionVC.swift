//
//  OnboardingCollectionVC.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 29.11.22.
//

import UIKit

class OnboardingCollectionVC: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(_ slide: OnboardingSlide) {
        imageView.image = slide.image
    }
}
