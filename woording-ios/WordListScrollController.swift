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
    
    
    
    
    override func viewDidLoad() {
        
            super.viewDidLoad()
         dataSource = self
        for word in currentList.lang1.words {
            var index = currentList.lang1.words.indexOf(word)
            let newDisplayController = DisplayPage()
            if index != nil {
             //   newDisplayController.word
            }
           // print(word)
        }
        
        self.pages = [DisplayPage(), DisplayPage(),DisplayPage(),DisplayPage(),DisplayPage(),DisplayPage()]
        
    }
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    func pageControllerAtIndex(index:Int) -> (UIViewController)
    {
        let newDisplayController = self.storyboard!.instantiateViewControllerWithIdentifier("displayPage") as! DisplayPage
        newDisplayController.pageIndex = index
        newDisplayController.word = self.currentList.lang1.words[index]
        newDisplayController.translation = self.currentList.lang2.words[index]
        print(self.currentList.lang2.words[index])
       // newDisplayController.
        return newDisplayController
    }
    
    
    
    //MARK Page View Data Source 
    // MARK: - UIPageViewControllerDataSource
   
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
            return self.storyboard!.instantiateViewControllerWithIdentifier("displayPage") as! DisplayPage
    }
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            return self.storyboard!.instantiateViewControllerWithIdentifier("displayPage") as! DisplayPage
    }
}