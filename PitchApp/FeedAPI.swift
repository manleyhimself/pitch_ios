//
//  FeedApi.swift
//  PitchApp
//
//  Created by Brendan Conor Manley on 3/15/16.
//  Copyright © 2016 Brendan Conor Manley. All rights reserved.
//

import Foundation
import Alamofire

class FeedAPI:API {
  
  func index(userId:Int, page:Int = 0, completion: (feedUsers: [FeedUser]) -> Void, failure: () -> Void) {
    let getUrl = "\(baseURL)/api/v1/feeds"
    let params = [
      "feed": [
        "user_id": userId,
        "user_offset": page,
        "seen_this_session_ids": [], //TODO: don't just hardcode this,
        "liked_limit": 2, //TODO: don't just hardcode this,
        "liked_offset": 0, //TODO: don't just hardcode this,
        "radius": 100 //TODO: don't just hardcode this
      ]
    ]
    queryBegan()
    Alamofire.request(.GET, getUrl, headers: headers, parameters: params).responseJSON { request, response, result in
      self.queryEnded()
      if response?.statusCode != 200 {
        failure()
        return
      }
      
      if let feedData = result.value?["users"] as? NSArray {
        var users:[FeedUser] = []
        for data in feedData {
          if let userData = data as? NSDictionary {
            users.append(
              FeedUser(
                id: userData["id"] as? Int,
                name: userData["name"] as? String,
                age: userData["age"] as? Int
              )
            )
          } else {
            NSLog("Failed to Cast userData as NSDictionary")
          }
        }
        
        completion(feedUsers: users)
        return
      }
      
      failure()
      return
    }
  }
}
