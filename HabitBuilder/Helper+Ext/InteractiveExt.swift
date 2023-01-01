//
//  InteractiveExt.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 16.12.22.
//

import UIKit

class InteractivePopNavigationController: UINavigationController {
    
    var isPushingViewController = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
        interactivePopGestureRecognizer?.delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        isPushingViewController = true
        super.pushViewController(viewController, animated: animated)
    }
}

extension InteractivePopNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer is UIScreenEdgePanGestureRecognizer else { return true }
        return viewControllers.count > 1 && !isPushingViewController
    }
}

extension InteractivePopNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        isPushingViewController = false
    }
}
