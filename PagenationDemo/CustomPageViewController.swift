//
//  CustomPageViewController.swift
//  PagenationDemo
//
//  Created by Suresh Shiga on 17/09/21.

//https://itnext.io/ios-uipageviewcontroller-easy-dd559c51ffa

import UIKit

class CustomPageViewController: UIPageViewController {
    
    var individualPageViewController = [UIViewController]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self;
        
        individualPageViewController = [
            DemoIndividualPageViewController.getInstance(index: 0),
            DemoIndividualPageViewController.getInstance(index: 1),
            DemoIndividualPageViewController.getInstance(index: 2),
            DemoIndividualPageViewController.getInstance(index: 3),
            DemoIndividualPageViewController.getInstance(index: 4),
        ]
        setViewControllers([individualPageViewController[0]], direction: .forward, animated: true, completion: nil)
    }
}


extension CustomPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let indexOfCurrentPageViewController = individualPageViewController.firstIndex(of: viewController)!
        
        if indexOfCurrentPageViewController == 0 {
            return nil // To show there is no previous page
        } else {
            // Previous UIViewController instance
            return individualPageViewController[indexOfCurrentPageViewController - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let indexOfCurrentPageViewController = individualPageViewController.firstIndex(of: viewController)!
        if indexOfCurrentPageViewController == individualPageViewController.count - 1 {
            return nil //To show there is no next page
        } else {
            // Next UIViewController instance
            return individualPageViewController[indexOfCurrentPageViewController + 1]
        }
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 5
    }
}
