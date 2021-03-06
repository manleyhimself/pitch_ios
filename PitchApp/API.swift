//
//  API.swift
//  PitchApp
//
//  Created by Brendan Conor Manley on 3/14/16.
//  Copyright © 2016 Brendan Conor Manley. All rights reserved.
//

import Foundation
import Alamofire
import SystemConfiguration


// Class that contains basic API functionality that will be passed on to our API call classes
class API {
  // BRENDAN
  static let domain = "http://192.168.1.6:3000"
  let baseURL = "http://192.168.1.6:3000/api/v1"
  
  var noConnectionFunc:() -> Void = {}
  
  var hasConnection:Bool {
    get {
      return self.hasNetworkConnection()
    }
  }
  
  var headers:[String:String] {
    get {
      return [
        "Content-Type": "application/json",
        "Accept": "application/json",
//        "AUTHORIZATION": "\(User.fetchApiToken())" TODO reinstate once authenication has been added
      ]
    }
  }
  
  func valuesPresent(value: AnyObject?, toTest:[String]) -> Bool {
    if value == nil {
      return false
    }
    for testKey in toTest {
      if let dict = value as? NSDictionary {
        if dict.objectForKey(testKey) == nil {
          return false
        }
      } else {
        return false
      }
    }
    return true
  }
  
  // Makes the network activity thing spin in the top right of the phone
  func queryBegan() {
    UIApplication.sharedApplication().networkActivityIndicatorVisible = true
  }
    
  // Makes the network activity thing stop spinning
  func queryEnded() {
    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
  }
  
  // Checks for network connection
  private func hasNetworkConnection() -> Bool {
    var zeroAddress = sockaddr_in()
    zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
    zeroAddress.sin_family = sa_family_t(AF_INET)
    let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
      SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
    }
    var flags = SCNetworkReachabilityFlags()
    if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
      // trigger no connection stuff
      return false
    }
    let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
    let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
    // trigger no connection stuff if no connection
    return (isReachable && !needsConnection)
  }
}