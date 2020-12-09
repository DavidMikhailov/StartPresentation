//
//  ContentViewController.swift
//  UIPageViewController
//
//  Created by Давид Михайлов on 01.12.2020.
//  Copyright © 2020 Давид Михайлов. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    @IBOutlet weak var presentTextLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var emojoLabel: UILabel!
    
    var presentText = ""
    var emoji = ""
    var currentPage = 0
    var numberOfPages = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTextLabel.text = presentText
        emojoLabel.text = emoji
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        
      
    }
    



}
