//
//  FeedCellView.swift
//  PitchApp
//
//  Created by Brendan Conor Manley on 3/15/16.
//  Copyright © 2016 Brendan Conor Manley. All rights reserved.
//

import UIKit

class FeedCellView:UICollectionViewCell {
  var label:UILabel! = {
    let label = UILabel(frame: CGRectMake(0, 0, 300, 30))
    label.textColor = UIColor.blackColor()
    return label
  }()
  
  var user:FeedUser! {
    didSet {
      let oldUser = oldValue
      if oldUser == nil || oldUser.id != user.id {
        updateCell()
      }
    }
  }
  
  func updateCell() {
    label.text = user.name
    //TODO: update all user info in cell (e.g. age or image)
  }
  
  
}
