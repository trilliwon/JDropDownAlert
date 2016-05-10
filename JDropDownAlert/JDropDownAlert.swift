//
//  JDropDownAlert.swift
//  JDropDownAlert
//
//  Created by Trillione on 2016. 4. 21..
//  Copyright © 2016년 Trillione. All rights reserved.
//

import UIKit

public class JDropDownAlert: UIButton {
  
  // default values
  // You can change this values to customize
  var height: CGFloat = 70
  var duration = 0.3
  var delay: Double = 2.0
  var stayDuration = 1.0
  
  var title = UILabel()
  var message = UILabel()
  
  private let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
  private let width = UIScreen.mainScreen().bounds.size.width
  
  public var didTapBlock: (() -> ())?
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init() {
    super.init(frame: CGRectMake(0.0, -self.height, width, self.height))
    self.frame = CGRectMake(0.0, -self.height, width, self.height)

    defaultSetting()
  }
  
  func defaultSetting() {
    
    // Title
    let titleFrame = CGRectMake(10, statusBarHeight, frame.size.width-10, 20)
    title = UILabel(frame: titleFrame)
    title.textAlignment = .Center
    message.numberOfLines = 10
    title.textColor = UIColor.whiteColor()
    title.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)!
    addSubview(title)
    
    // Message
    let messageFrame = CGRectMake(10, statusBarHeight+titleFrame.height+5, frame.size.width-10, 20)
    message = UILabel(frame: messageFrame)
    message.textAlignment = .Center
    message.lineBreakMode = .ByWordWrapping
    message.numberOfLines = 10
    message.textColor = UIColor.whiteColor()
    message.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)!
    addSubview(message)
    
    self.backgroundColor = UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 1)
    self.addTarget(self, action: #selector(viewDidTap), forControlEvents: .TouchUpInside)
  }

  func viewDidTap() {
    didTapBlock?()
    hide(self)
  }
  
  func hide(alertView: UIButton) {
    UIView.animateWithDuration(duration) {
      alertView.frame.origin.y = -self.height
    }
    performSelector(#selector(remove), withObject: alertView, afterDelay: delay)
  }
  
  func remove(alertView: UIButton) {
    alertView.removeFromSuperview()
  }
  
  // MARK: - Hub method
  func show(title: String, message: String?, textColor: UIColor?, backgroundColor: UIColor?) {
    addWindowSubview(self)
    configureProperties(title, message: message, textColor: textColor, backgroundColor: backgroundColor, delay: delay, duration: duration, height: height)
    
    UIView.animateWithDuration(self.duration) {
      self.frame.origin.y = 0
    }
    
    performSelector(#selector(hide), withObject: self, afterDelay: self.delay)
  }
  
  func addWindowSubview(view: UIView) {
    if self.superview == nil {
      let frontToBackWindows = UIApplication.sharedApplication().windows.reverse()
      for window in frontToBackWindows {
        if window.windowLevel == UIWindowLevelNormal && !window.hidden {
          window.addSubview(view)
          return
        }
      }
    }
  }
  
  func configureProperties(title: String, message: String?, textColor: UIColor?, backgroundColor: UIColor?, delay:Double?, duration: Double?, height: CGFloat?) {
    
    self.title.text = title
    
    if let height = height {
      self.height = height
      self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.width, height)
    }
    
    if let message = message {
      self.message.text = message
    }else {
      self.message.hidden = true
      self.title.frame.origin.y = self.height/2
    }
    
    if let textColor = textColor {
      self.title.textColor = textColor
      self.message.textColor = textColor
    }
    
    if let delay = delay {
      self.delay = delay
    }
    
    if let duration = duration {
      self.duration = duration
    }
    
    if let backgroundColor = backgroundColor {
      self.backgroundColor = backgroundColor
    }
  }
  
  // MARK: used funcs, intefaces
  // title
  public func alertWithTitle(title: String,
                             height: CGFloat?) {
    
    show(title,
         message: nil,
         textColor: nil,
         backgroundColor: nil)
  }
  
  
  public func alertWithTitle(title: String,
                             textColor: UIColor) {
    
    show(title,
         message: nil,
         textColor: textColor,
         backgroundColor: nil)
  }
  
  
  public func alertWithTitle(title: String,
                             backgroundColor: UIColor) {
    
    show(title,
         message: nil,
         textColor: nil,
         backgroundColor: backgroundColor)
  }
  
  
  
  // message
  public func alertWithTitle(title: String,
                             message: String) {
    
    show(title,
         message: message,
         textColor: nil,
         backgroundColor: nil)
  }
  
  
  public func alertWithTitle(title: String,
                             message: String,
                             textColor: UIColor) {
    
    show(title,
         message: message,
         textColor: textColor,
         backgroundColor: nil)
  }
  
  
  public func alertWithTitle(title: String,
                             message: String,
                             backgroundColor: UIColor) {
    
    show(title,
         message: message,
         textColor: nil,
         backgroundColor: backgroundColor)
  }
}
