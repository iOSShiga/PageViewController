//
//  DemoIndividualPageViewController.swift
//  PagenationDemo
//
//  Created by Suresh Shiga on 17/09/21.
//

import UIKit

class DemoIndividualPageViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = "(Page \(index)"
        view.backgroundColor = index % 2 == 0 ? .systemBlue : .systemGreen
    }
    
  static func getInstance(index: Int) -> DemoIndividualPageViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DemoIndividualPageViewController") as! DemoIndividualPageViewController
           vc.index = index
        return vc
    }
}
