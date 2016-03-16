//
//  Feed.swift
//  PitchApp
//
//  Created by Brendan Conor Manley on 3/14/16.
//  Copyright © 2016 Brendan Conor Manley. All rights reserved.
//

import UIKit

class FeedIndexViewController:UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
  // View Components
  var userCollectionView:UICollectionView = ViewComponents.Feed.Collection.collectionView
  var footer:FooterRefreshControl!
  
  // API
  var users:[FeedUser] = []
  var busy:Bool = false
  var api = FeedAPI()
  var page:Int = 0
  let perPage:Int = 20
  var noMoreContent = false {
    didSet {
      if noMoreContent {
        footer?.loadMoreToNoMore()
      } else {
        footer?.noMoreToLoadMore()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "User Feed AKA Needs Cooler Title"
    setupCollectionView()
    getData()
  }
  
  func getData() {
    if busy { return }
    busy = true
    page = 0
    noMoreContent = false
    //below is a stubbed userId
    api.index(1, page: page, completion: { feedUsers in
      self.users = feedUsers
      self.userCollectionView.reloadData()
      self.busy = false
      self.noMoreContent = feedUsers.count < self.perPage
      }, failure: {
        self.busy = false
        print("didnt work")
    })
  }
  
  func appendData() {
    if busy { return }
    footer.startLoader()
    busy = true
    page++
    api.index(1, page: page, completion: { feedUsers in
      self.users.appendContentsOf(feedUsers)
      self.userCollectionView.reloadData()
      self.footer.stopLoader()
      self.busy = false
      self.noMoreContent = feedUsers.count < self.perPage
      }, failure: {
        self.footer.stopLoader()
        self.busy = false
        print("didnt work")
    })
  }
  
  func setupCollectionView() {
    userCollectionView.dataSource = self
    userCollectionView.delegate = self
    view.addSubview(userCollectionView)
  }
  
  func scrollViewDidScroll(scrollView: UIScrollView) {
    scrollView.bounces = scrollView.contentOffset.y > 100
    scrollView.scrollEnabled = scrollView.contentOffset.y > 0
    if scrollAtBottom && !busy && !noMoreContent {
      appendData()
    }
  }
  
  private var scrollAtBottom:Bool {
    get {
      let scrollOffsetY = userCollectionView.contentOffset.y  - (userCollectionView.contentSize.height - Bounds.height)
      return abs(scrollOffsetY) < 100
    }
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    let footerSize: CGSize = ViewComponents.Feed.Collection.Footer.size
    return footerSize
  }
  
  func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
    switch kind {
    case UICollectionElementKindSectionFooter:
      footer = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "Footer", forIndexPath: indexPath) as! FooterRefreshControl
      return footer
    default:
      return UICollectionReusableView()
    }
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return users.count
  }
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    let cell = collectionView.cellForItemAtIndexPath(indexPath) as! FeedCellView
    // do something?
    return
  }
  
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! FeedCellView
    let user = users[indexPath.row]
    cell.user = user
    return cell
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}