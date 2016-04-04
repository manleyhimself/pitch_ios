//
//  Collection.swift
//  PitchApp
//
//  Created by Brendan Conor Manley on 3/15/16.
//  Copyright © 2016 Brendan Conor Manley. All rights reserved.
//

import UIKit

// What does this line do? -GW
// Answer: This allows you to add code to an already existing struct. The "Feed" Stuct was
//        defined within the "ViewComponents" Struct, which is why we access it with dot notation.
//        Then evertying within the brackets which are opened up on line 18, is added to the "Feed" Struct.

extension ViewComponents.Feed {
    
  struct Collection {
    private static let width:CGFloat = Bounds.width
    
    static let frame:CGRect = CGRectMake(0, 0, width, Bounds.height)
    static let cellSize:CGSize = CGSize(width: width, height: Bounds.height - 50)
    
    static var collectionView:UICollectionView {
      let collection = UICollectionView(frame: frame, collectionViewLayout: layout)
      collection.backgroundColor = UIColor(red:0.878, green:0.878, blue: 0.878, alpha: 1)
      collection.registerClass(FeedCellView.self, forCellWithReuseIdentifier: "Cell")
      collection.registerClass(FooterRefreshControl.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "Footer")
      return collection
    }
    
    static var layout:UICollectionViewFlowLayout {
      let layout = UICollectionViewFlowLayout()
      layout.itemSize = cellSize
      return layout
    }
    
    struct Footer {
      static let size:CGSize = CGSizeMake(width, 60)
      
      static var loader:UIActivityIndicatorView {
        let bottomLoader = UIActivityIndicatorView(frame: CGRectMake(0, 10, width, 60))
        bottomLoader.alpha = 0
        bottomLoader.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        bottomLoader.color = UIColor.grayColor()
        bottomLoader.backgroundColor = UIColor.whiteColor()
        return bottomLoader
      }
      
      static let btnFrame = CGRectMake(frame.width/2 - 50, 15, 100, 40)
      
      static var loadBtn:UIButton {
        let loadBtn = ViewComponents.Buttons.footerRefreshBtn(frame: btnFrame)
        return loadBtn
      }
    }
 
  }
}