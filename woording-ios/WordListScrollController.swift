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
    
     var currentList: WordList = ("name", ("this", ["sdfdf"]), ("this", ["sdfsdf"]))
    
    var mode : String = "display"
    
    var pages : [DisplayPage] = []
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.grayColor()
        appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
        appearance.backgroundColor = UIColor.darkGrayColor()
    }

    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        setupPageControl()
        dataSource = self
        
        
        
        for word in currentList.lang1.words {
            let storyboards = UIStoryboard(name: "Main", bundle: nil)
           
            let newPC = storyboards.instantiateViewControllerWithIdentifier("displayPage") as! DisplayPage
            
            
            
            
            let index = currentList.lang1.words.indexOf(word)
            
            
          
            if index != nil {
                newPC.word = word
                newPC.translation = currentList.lang2.words[index!]
                pages.append(newPC)
               
            }
      //  print(word)
        }
        
        
        
        
      
        let this = pageControllerAtIndex(3) as! DisplayPage
        print(this.word)
        
    }
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    func pageControllerAtIndex(index:Int) -> (UIViewController)
    {
        let newDisplayController = self.storyboard!.instantiateViewControllerWithIdentifier("displayPage") as! DisplayPage
        newDisplayController.pageIndex = index
        newDisplayController.word = self.currentList.lang1.words[index]
        newDisplayController.translation = self.currentList.lang2.words[index]
        //print(self.currentList.lang2.words[index])
       // newDisplayController.
        return newDisplayController
    }
    
    
    
    //MARK Page View Data Source 
    // MARK: - UIPageViewControllerDataSource
   
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
            let index = pages.indexOf(viewController as! DisplayPage)
        
        return pages[1]
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let index = pages.indexOf(viewController as! DisplayPage)
        
        return pages[1]
    }
}