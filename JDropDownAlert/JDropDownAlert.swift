//
//  JDropDownAlert.swift
//  JDropDownAlert
//
//  Created by Trillione on 2016. 4. 21..
//  Copyright © 2016년 Trillione. All rights reserved.
//

import UIKit

let JDropdownAlertDismissAllNotification = "JDropdownAlertDismissAllNotification"

public class JDropDownAlert: UIButton {
  
  var height: CGFloat = 50
  var duration = 0.3
  var delay: Double = 2.0
  var stayDuration = 1.0
  
  var title = UILabel()
  var message = UILabel()
  
  private let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
  private let width = UIScreen.mainScreen().bounds.size.width
  
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    // Title
    let titleFrame = CGRectMake(10, statusBarHeight, frame.size.width-10, 20)
    title = UILabel(frame: titleFrame)
    title.textAlignment = .Center
    message.numberOfLines = 10
    addSubview(title)
    
    // Message
    let messageFrame = CGRectMake(10, statusBarHeight+titleFrame.height+5, frame.size.width-10, 20)
    message = UILabel(frame: messageFrame)
    message.textAlignment = .Center
    message.lineBreakMode = .ByWordWrapping
    message.numberOfLines = 10
    addSubview(message)
    
    self.backgroundColor = UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 1)
    
    configureLabel()
    
    self.addTarget(self, action: #selector(hide(_:)), forControlEvents: .TouchUpInside)
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(viewDidTap), name: JDropdownAlertDismissAllNotification, object: nil)
  }
  
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self, name: JDropdownAlertDismissAllNotification, object: nil)
  }
  
  
  func viewDidTap() {
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
  
  
  // MARK: - JDropDownAlert Instance
  func alertView() -> JDropDownAlert {
    let frame = CGRectMake(0.0, -self.height, width, self.height)
    return JDropDownAlert(frame: frame)
  }
  
  // MARK: - Hub method
  func show(title: String, message: String?, textColor: UIColor?, backgroundColor: UIColor?, delay:Double?, duration: Double?, height: CGFloat?) {
    
    addWindowSubview(self)
    configureProperties(title, message: message, textColor: textColor, backgroundColor: backgroundColor, delay: delay, duration: duration, height: height)
    
    UIView.animateWithDuration((duration == nil) ? self.duration : duration!) {
      self.frame.origin.y = 0
    }
    
    performSelector(#selector(viewDidTap), withObject: self, afterDelay: (delay == nil) ? self.delay : delay!)
  }
  
  func addWindowSubview(view: UIView) {
    if self.superview == nil {
      let frontToBackWindows = UIApplication.sharedApplication().windows.reverse()
      for window in frontToBackWindows {
        if window.windowLevel == UIWindowLevelNormal && !window.hidden {
          window.addSubview(view)
          break
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
  public class func alertWithTitle(title: String,
                            delay: Double?,
                            duration: Double?,
                            height: CGFloat?) {
    
    JDropDownAlert().alertView().show(title,
                                      message: nil,
                                      textColor: nil,
                                      backgroundColor: nil,
                                      delay: delay,
                                      duration: duration,
                                      height: height)
  }
  
  
  public class func alertWithTitle(title: String,
                            textColor: UIColor,
                            delay: Double?,
                            duration: Double?,
                            height: CGFloat?) {
    
    JDropDownAlert().alertView().show(title,
                                      message: nil,
                                      textColor: nil,
                                      backgroundColor: nil,
                                      delay: delay,
                                      duration: duration,
                                      height: height)
  }
  
  
  public class func alertWithTitle(title: String,
                            backgroundColor: UIColor,
                            delay: Double?,
                            duration: Double?,
                            height: CGFloat?) {
    
    JDropDownAlert().alertView().show(title,
                                      message: nil,
                                      textColor: nil,
                                      backgroundColor: backgroundColor,
                                      delay: delay,
                                      duration: duration,
                                      height: height)
  }
  
  
  
  // message
  
  public class func alertWithTitle(title: String,
                            message: String,
                            delay: Double?,
                            duration: Double?,
                            height: CGFloat?) {
    
    JDropDownAlert().alertView().show(title,
                                      message: message,
                                      textColor: nil,
                                      backgroundColor: nil,
                                      delay: delay,
                                      duration: duration,
                                      height: height)
  }
  
  
  public class func alertWithTitle(title: String,
                            message: String,
                            textColor: UIColor,
                            delay: Double?,
                            duration: Double?,
                            height: CGFloat?) {
    
    JDropDownAlert().alertView().show(title,
                                      message: message,
                                      textColor: textColor,
                                      backgroundColor: nil,
                                      delay: delay,
                                      duration: duration,
                                      height: height)
  }
  
  
  public class func alertWithTitle(title: String,
                            message: String,
                            backgroundColor: UIColor,
                            delay: Double?,
                            duration: Double?,
                            height: CGFloat?) {
    
    JDropDownAlert().alertView().show(title,
                                      message: message,
                                      textColor: nil,
                                      backgroundColor: backgroundColor,
                                      delay: delay,
                                      duration: duration,
                                      height: height)
  }
  
  // set font
  public class func setDropDownAlertTextFont(titleFontName: String,
                                      titleFontSize: CGFloat,
                                      messageFontName: String,
                                      messageFontSize: CGFloat) {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    defaults.setObject(titleFontName, forKey: "JDropDownAlert_title_font_name")
    defaults.setObject(titleFontSize, forKey: "JDropDownAlert_title_font_size")
    defaults.setObject(messageFontName, forKey: "JDropDownAlert_message_font_name")
    defaults.setObject(messageFontSize, forKey: "JDropDownAlert_message_font_size")
    
    defaults.synchronize()
  }
  
  func configureLabel() {
    let defaults = NSUserDefaults.standardUserDefaults()
    
    if
      let fontName = defaults.objectForKey("JDropDownAlert_title_font_name") as? String,
      let fontSize = defaults.objectForKey("JDropDownAlert_title_font_size") as? CGFloat {
      
      title.font  = UIFont(name: fontName, size: fontSize)!
    }else {
      title.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)!
    }
    
    if
      let fontName = defaults.objectForKey("JDropDownAlert_message_font_name") as? String,
      let fontSize = defaults.objectForKey("JDropDownAlert_message_font_size") as? CGFloat {
      message.font  = UIFont(name: fontName, size: fontSize)!
    }else {
      message.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)!
    }
    
    title.textColor = UIColor.whiteColor()
    message.textColor = UIColor.whiteColor()
  }
}
