//
//  ViewComponents.swift
//  PitchApp
//
//  Created by Brendan Conor Manley on 3/14/16.
//  Copyright © 2016 Brendan Conor Manley. All rights reserved.
//

import UIKit

// Bounds object provides the width & height of the device for access throughout
let Bounds:CGSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height - 64)
let aspectRatio:CGFloat = Bounds.height / Bounds.width


struct ViewComponents {
  static let activeColor = UIColor.blueColor()
  
  static func imageOfColor(color: UIColor) -> UIImage {
    let rect = CGRectMake(0, 0, 1, 1)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    CGContextSetFillColorWithColor(context, color.CGColor)
    CGContextFillRect(context, rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
  
  struct Feed {}
}