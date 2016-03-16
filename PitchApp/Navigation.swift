//
//  Navigation.swift
//  PitchApp
//
//  Created by Brendan Conor Manley on 3/16/16.
//  Copyright © 2016 Brendan Conor Manley. All rights reserved.
//

import UIKit

class FeedNavigationController:UINavigationController, UINavigationControllerDelegate {
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationBar.tintAdjustmentMode = UIViewTintAdjustmentMode.Normal
    navigationBar.barTintColor = UIColor.whiteColor()
    navigationBar.tintColor = UIColor.blackColor()
    let navbarTitleTextAttributes: [String : AnyObject] = [
      NSForegroundColorAttributeName : UIColor.blackColor(),
    ]
    navigationBar.translucent = false
    delegate = self
    navigationBar.titleTextAttributes = navbarTitleTextAttributes
    assignRootViewController()
  }
  
  func assignRootViewController() {
    viewControllers.append(FeedIndexViewController())
  }
  
  func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
  
  }
  
  func failure() {
    
  }

}
