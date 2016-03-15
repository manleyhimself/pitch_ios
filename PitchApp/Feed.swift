//
//  Feed.swift
//  PitchApp
//
//  Created by Brendan Conor Manley on 3/14/16.
//  Copyright © 2016 Brendan Conor Manley. All rights reserved.
//

import UIKit

class FeedViewController:UIViewController {
  
  override func viewDidLoad() {
    let label = UILabel(frame: CGRectMake(0, 0, Bounds.width, 30))
    label.text = "Hello, world"
    view.addSubview(label)
  }
  
}
