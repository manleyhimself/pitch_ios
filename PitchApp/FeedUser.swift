//
//  User.swift
//  PitchApp
//
//  Created by Brendan Conor Manley on 3/15/16.
//  Copyright © 2016 Brendan Conor Manley. All rights reserved.
//

import Foundation

// Struct that will store user info the feed collection view
struct FeedUser {
  let id:Int?
  let name:String?
  let age:Int?
}


/* 
Questions for Brendan:
1. ViewComponents/Buttons and ViewComponents/ViewComponents?
 Answer: These just contain elements, or views, that can be dropped in elsewhere. Such as buttons with certain colors.
2. Views/Feed/Index/FooterRefreshControl?
 Answer: The collection view, which the Feed is made from, has a footer which is used to load in new content. When it's in view, 
        the next API call is triggered.
*/