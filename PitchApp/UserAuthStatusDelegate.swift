//
//  Root.swift
//  PitchApp
//
//  Created by Brendan Conor Manley on 3/16/16.
//  Copyright © 2016 Brendan Conor Manley. All rights reserved.
//

import UIKit

class UserAuthStatusDelegateViewController:UIViewController {
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    //TODO add conditional which attempts to authenticate user, before presenting a view controller

    if let tabBarController = storyboard?.instantiateViewControllerWithIdentifier("MainTabBarController") as? UITabBarController {
      presentViewController(tabBarController, animated: false, completion: nil)
    }
  }
}
