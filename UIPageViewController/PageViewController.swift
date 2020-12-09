//
//  PageViewController.swift
//  UIPageViewController
//
//  Created by Давид Михайлов on 01.12.2020.
//  Copyright © 2020 Давид Михайлов. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    let presentScreenContent = [
        "Первая страница презентации, рассказывающая о приложениее",
        "Вторая страница презентации рассказыает о какой-то фишке",
        "Третья страница презентации рассказыает о чем-то очень интересном",
        "Чертвертая страница презентации с напутствием в добрый путь! =)",
        ""
    ]
    
    let emojiArray = ["👋🏻", "🤟🏻", "🤤", "👍🏻", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let contentPageVC = self.showViewControllerAtIndex(0) {
                  setViewControllers([contentPageVC], direction: .forward, animated: true, completion: nil)
          
        }
        
    }
    
    func showViewControllerAtIndex (_ index: Int) -> ContentViewController? {
        guard index >= 0 else {return nil}
        guard index < presentScreenContent.count else {
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "presentationWasViewed")
            dismiss(animated: true, completion: nil )
            return nil
        }
        guard let contentViewController = storyboard?.instantiateViewController(withIdentifier:"ContentViewController") as? ContentViewController else {return nil}
        
        contentViewController.presentText = presentScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPages = presentScreenContent.count
        
        return contentViewController
            
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber -= 1
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber += 1
        return showViewControllerAtIndex(pageNumber)
    }
    
     
}
