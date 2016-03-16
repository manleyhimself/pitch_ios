//
//  Buttons.swift
//  PitchApp
//
//  Created by Brendan Conor Manley on 3/15/16.
//  Copyright © 2016 Brendan Conor Manley. All rights reserved.
//

import UIKit

extension ViewComponents {
  struct Buttons {
    struct ColorImages {
      // The following creates a 1x1px image for use with buttons.  Using an image rather than a background color
      // allows for the btn to recieve highlighted states and disabled states by default
      // Assigned with getters to reduce memory footprint
      
      // basic colors
      static var whiteBtn:UIImage { return ViewComponents.imageOfColor(UIColor.whiteColor()) }
      static var grayBtn:UIImage { return ViewComponents.imageOfColor(UIColor.grayColor()) }
      static var redBtn:UIImage { return ViewComponents.imageOfColor(UIColor.redColor()) }
      static var greenBtn:UIImage { return ViewComponents.imageOfColor(UIColor.greenColor()) }
      static var brownBtn:UIImage { return ViewComponents.imageOfColor(UIColor.brownColor()) }
      static var blueBtn:UIImage { return ViewComponents.imageOfColor(UIColor.blueColor()) }
      
      // defaults
      static var defaultBtn:UIImage { return whiteBtn }
      static var defaultDisabledBtn:UIImage { return grayBtn }
      
      // feed index
      static var footerBtn:UIImage { return whiteBtn }
    }
    
    static func defaultBtn(title:String = "Submit", frame: CGRect) -> UIButton {
      let btn = UIButton(frame: frame)
      btn.layer.borderWidth = 1
      btn.layer.borderColor = UIColor.grayColor().CGColor
      btn.setTitle(title, forState: .Normal)
      btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
      btn.setBackgroundImage(ColorImages.defaultBtn, forState: .Normal)
      btn.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
      btn.setTitleColor(UIColor.whiteColor(), forState: .Disabled)
      btn.setBackgroundImage(ColorImages.defaultDisabledBtn, forState: .Disabled)
      return btn
    }
    
    static func footerRefreshBtn(frame frame: CGRect) -> UIButton {
      let loadBtn = UIButton(frame: frame)
      loadBtn.setTitle("Load More", forState: .Normal)
      loadBtn.layer.cornerRadius = 5
      loadBtn.clipsToBounds = true
      loadBtn.layer.borderColor = UIColor.grayColor().CGColor
      loadBtn.layer.borderWidth = 1
      loadBtn.setBackgroundImage(ColorImages.footerBtn, forState: .Normal)
      loadBtn.setTitleColor(UIColor.grayColor(), forState: .Normal)
      loadBtn.titleLabel?.lineBreakMode = .ByWordWrapping
      loadBtn.titleLabel?.textAlignment = .Center
      loadBtn.setTitle("No More Content to Load", forState: .Disabled)
      return loadBtn
    }
    
  }
}
