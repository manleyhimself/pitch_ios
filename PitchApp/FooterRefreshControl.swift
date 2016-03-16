//
//  FooterRefreshControl.swift
//  PitchApp
//
//  Created by Brendan Conor Manley on 3/15/16.
//  Copyright © 2016 Brendan Conor Manley. All rights reserved.
//

import UIKit

class FooterRefreshControl:UICollectionReusableView {
  var loader:UIActivityIndicatorView = ViewComponents.Feed.Collection.Footer.loader
  var loadBtn:UIButton = ViewComponents.Feed.Collection.Footer.loadBtn
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupSubviews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupSubviews() {
    for view in [loader, loadBtn] {
      addSubview(view)
    }
  }
  
  func startLoader() {
    self.loader.startAnimating()
    UIView.animateWithDuration(0.4, animations: {
      self.loader.alpha = 1
      self.loadBtn.alpha = 0
    })
  }
  
  func stopLoader() {
    UIView.animateWithDuration(0.4, animations: {
      self.loader.alpha = 0
      self.loadBtn.alpha = 1
      }, completion: { complete in
        self.loader.stopAnimating()
    })
  }
  
  func loadMoreToNoMore() {
    loadBtn.enabled = false
    loadBtn.layer.borderColor = UIColor.whiteColor().CGColor
    sizeLoadMoreBtn()
    loadBtn.removeTarget(self, action: "loadBtnTapped", forControlEvents: .TouchUpInside)
  }
  
  func sizeLoadMoreBtn() {
    loadBtn.sizeToFit()
    loadBtn.frame.origin = CGPointMake(ViewComponents.Feed.Collection.frame.width / 2 - loadBtn.frame.width / 2, 15)
  }
  
  func noMoreToLoadMore() {
    loadBtn.enabled = true
    loadBtn.frame = ViewComponents.Feed.Collection.Footer.btnFrame
    loadBtn.layer.borderColor = UIColor.grayColor().CGColor
    loadBtn.addTarget(self, action: "loadBtnTapped", forControlEvents: .TouchUpInside)
  }
  
  func loadBtnTapped() {
    if let vc = UIApplication.topViewController() as? FeedIndexController {
      vc.appendData()
    }
  }
}
