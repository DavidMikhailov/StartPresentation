//
//  ViewController.swift
//  UIPageViewController
//
//  Created by Давид Михайлов on 01.12.2020.
//  Copyright © 2020 Давид Михайлов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let pageViewController = storyboard?.instantiateViewController(
            withIdentifier: "PageViewController") as? PageViewController {
            
            self.present(pageViewController, animated: true, completion: nil)
        }
    }
    
    func startPresentation () {
        
        let userDefaults = UserDefaults.standard
        let presentationWasViewed = userDefaults.bool(forKey: "presentationWasViewed")
        if presentationWasViewed == false {
            
            
        if let pageViewController = storyboard?.instantiateViewController(
        withIdentifier: "PageViewController") as? PageViewController {

        self.present(pageViewController, animated: true, completion: nil)
            }
        }
    }
}

