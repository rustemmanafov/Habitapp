//
//  OnboardingVC.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 29.11.22.
//

import UIKit

struct OnboardingSlide {
    let image: UIImage
}

class OnboardingVC: MainVC {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtnOutlet: UIButton!
    @IBOutlet weak var skipBtnOutlet: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var customButton: CustomButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var slides: [OnboardingSlide] = []
    var previousItem = -1
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                customButton.isHidden = false
            } else {
                nextBtnOutlet.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [    OnboardingSlide(image: UIImage(named: "onboardingSlide1")!),
                      OnboardingSlide(image: UIImage(named: "onboardingSlide2")!),
                      OnboardingSlide(image: UIImage(named: "onboardingSlide3")!),
                      OnboardingSlide(image: UIImage(named: "onboardingSlide4")!)
        ]
        
        setupUI()
        
    }
    
    func setupUI() {
        nextBtnOutlet.titleLabel?.font = UIFont(name: "Manrope-Bold", size: 17)
        skipBtnOutlet.titleLabel?.font = UIFont(name: "Manrope-Bold", size: 17)
        
        titleLabel.text = "WELCOME TO MONUMENTAL HABITS"
        descriptionLabel.text = "We can help you to be a better version of yourself.".uppercased()
        titleLabel.lineBreakMode = .byTruncatingMiddle
        
        titleLabel.textColor = UIColor(red: 0.341, green: 0.2, blue: 0.325, alpha: 1)
        titleLabel.font = UIFont(name: "Klasik Regular", size: 30)
        
        descriptionLabel.textColor = UIColor(red: 0.341, green: 0.2, blue: 0.325, alpha: 1)
        descriptionLabel.font = UIFont(name: "Manrope-Bold", size: 17)
        descriptionLabel.textAlignment = .center
        
        pageControl.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        
        pageControl.numberOfPages = slides.count
        
        let attributedString = NSMutableAttributedString.init(string: descriptionLabel.text ?? "")
        let range = NSString(string: descriptionLabel.text ?? "").range(of: "help you", options: String.CompareOptions.caseInsensitive)
        let range2 = NSString(string: descriptionLabel.text ?? "").range(of: "yourself", options: String.CompareOptions.caseInsensitive)
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.98, green: 0.71, blue: 0.40, alpha: 1.00)], range: range)
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.98, green: 0.71, blue: 0.40, alpha: 1.00)], range: range2)
        descriptionLabel.attributedText = attributedString
        descriptionLabel.attributedText = attributedString
       
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        pageControl.pageIndicatorTintColor = UIColor(red: 0.98, green: 0.71, blue: 0.40, alpha: 1.00)
        
        customButton.isHidden = true
        
        customButton.buttonCallback = {
            let controller = self.storyboard?.instantiateViewController(identifier: "loginNav") as! LoginViewController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnboarded = true
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func updatePageControl() {
        pageControl.currentPage = currentPage
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
    }
    
    @IBAction func skipBtnAct(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "loginNav") as! LoginViewController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        UserDefaults.standard.hasOnboarded = true
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func nextBtnAct(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "loginNav") as! LoginViewController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            print(currentPage)
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.isPagingEnabled = false
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            collectionView.isPagingEnabled = true
            updatePageControl()
        }
    }
}

extension OnboardingVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionVC", for: indexPath) as! OnboardingCollectionVC
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = findMaxIndex(in: collectionView.indexPathsForVisibleItems)
        updatePageControl()
    }
    
    func findMaxIndex(in indexPaths: [IndexPath]) -> Int {
        var max: Int = 0
        
        var items: [Int] = []
        
        for indexPath in indexPaths {
            items.append(indexPath.item)
        }
        
        max = items.max()!
        
        return max
    }
}
