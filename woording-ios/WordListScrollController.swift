//
//  WordListScrollController.swift
//  woording-ios
//
//  Created by Justin on 1/22/16.
//  Copyright © 2016 Woording. All rights reserved.
//

import Foundation
import UIKit

class WordListScrollController : UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    typealias wordArray = (locale:String, words :[String])
    typealias WordList = (name : String, lang1: wordArray, lang2:wordArray)
    
     var currentList: WordList = ("name", ("this", [""]), ("this", [""]))
    
    var mode : String = "display"
    
    var pages : [DisplayPage] = []
    
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        for word in currentList.lang1.words {
            var index = currentList.lang1.words.indexOf(word)
            let newDisplayController = DisplayPage()
            newDisplayController.word = self.currentList.lang1.words[index!]
            newDisplayController.translation = self.currentList.lang2.words[index!]
            pages.append(newDisplayController)
        }
        
        
    }
    
    
    
    
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
            return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            return nil
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func pageControllerAtIndex(index:Int) -> (UIViewController)
    {
        let newDisplayController = self.storyboard!.instantiateViewControllerWithIdentifier("displayPage") as! DisplayPage
        newDisplayController.pageIndex = index
        newDisplayController.word = self.currentList.lang1.words[index]
        newDisplayController.translation = self.currentList.lang2.words[index]
       // newDisplayController.
        return newDisplayController
    }
    
    
    
    //MARK Page View Data Source 
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
        
    {
        
        
        
        var vc = viewController as! DisplayPage
        
        var index = vc.pageIndex as Int
        
        
        
        
        
        if (index == 0 || index == NSNotFound)
            
        {
            
            return nil
            
            
            
        }
        
        
        
        index--
        
        return self.viewControllerAtIndex(index)
        
        
        
    }
    
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        
        
        var vc = viewController as ContentViewController
        
        var index = vc.pageIndex as Int
        
        
        
        if (index == NSNotFound)
            
        {
            
            return nil
            
        }
        
        
        
        index++
        
        
        
        if (index == self.pageTitles.count)
            
        {
            
            return nil
            
        }
        
        
        
        return self.viewControllerAtIndex(index)
        
        
        
    }
    
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
        
    {
        
        return self.pageTitles.count
        
    }
    
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
        
    {
        
        return 0
        
    }
   
    
}