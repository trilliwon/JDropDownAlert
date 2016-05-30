//
//  JDropDownAlert.swift
//  JDropDownAlert
//
//  Created by Trillione on 2016. 4. 21..
//  Copyright © 2016년 Trillione. All rights reserved.
//

import UIKit

public class JDropDownAlert: UIButton {
  
  enum AlertPosition {
    case Top, Bottom, StatusBar
  }
  
  // default values
  // You can change this values to customize
  private let height: CGFloat = 70
  private let duration = 0.3
  private let delay: Double = 2.0
  
  private var title = UILabel()
  private var message = UILabel()
  
  private var position = AlertPosition.Top
  
  private let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
  private let screenWidth = UIScreen.mainScreen().bounds.size.width
  private let screenHeight = UIScreen.mainScreen().bounds.size.height
  
  
  public var didTapBlock: (() -> ())?
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(position: AlertPosition = .Top) {
    super.init(frame: CGRectZero)
    self.frame = getNotificationViewWithAlertPosition(position)
    self.position = position
    defaultSetting()
  }
  
  private func defaultSetting() {
    
    // Title
    let titleFrame = getTitleFrameWithAlertPosition(position)
    title = UILabel(frame: titleFrame)
    title.textAlignment = .Center
    title.numberOfLines = 10
    title.textColor = UIColor.whiteColor()
    title.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)!
    addSubview(title)
    
    // Message
    let messageFrame = getMessageFrameWithAlertPosition(position, titleFrame: titleFrame)
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
  
  // MARK: - dimensions method
  private func getNotificationViewWithAlertPosition(alertPosition: AlertPosition) -> CGRect  {
    switch alertPosition {
    case .Top:
      return CGRectMake(0.0, -self.height, screenWidth, self.height)
    case . Bottom:
      return CGRectMake(0.0, self.screenHeight + self.height, self.screenWidth, self.height)
    default:
      return CGRectMake(0.0, -self.height, screenWidth, statusBarHeight)
    }
  }
  
  private func getTitleFrameWithAlertPosition(alertPosition: AlertPosition) -> CGRect {
    switch alertPosition {
    case .Top:
      return CGRectMake(10, statusBarHeight, frame.size.width - 10, 20)
    case . Bottom:
      return CGRectMake(10, 15, frame.size.width - 10, 20)
    default:
      //need change
      return CGRectMake(10, 0, frame.size.width - 10, 20)
    }
  }
  
  private func getMessageFrameWithAlertPosition(alertPosition: AlertPosition, titleFrame: CGRect) -> CGRect {
    switch alertPosition {
    case .Top:
      return CGRectMake(10, statusBarHeight + titleFrame.height + 5, frame.size.width - 10, 20)
    case . Bottom:
      return CGRectMake(10, titleFrame.size.height + titleFrame.height, frame.size.width - 10, 20)
    default:
      return CGRectZero
    }
  }
  
  // MARK: - tap method
  @objc private func viewDidTap() {
    didTapBlock?()
    hide(self)
  }
  
  @objc private func hide(alertView: UIButton) {
    
    UIView.animateWithDuration(duration) {
      
      (self.position == .Bottom) ? (alertView.frame.origin.y = self.screenHeight) : (alertView.frame.origin.y = -self.height)
    }
    performSelector(#selector(remove), withObject: alertView, afterDelay: delay)
  }
  
  @objc private func remove(alertView: UIButton) {
    alertView.removeFromSuperview()
  }
  
  // MARK: - Hub method
  @objc private func show(title: String, message: String?, textColor: UIColor?, backgroundColor: UIColor?) {
    addWindowSubview(self)
    configureProperties(title, message: message, textColor: textColor, backgroundColor: backgroundColor)
    
    UIView.animateWithDuration(self.duration) {
      
      (self.position == .Bottom) ? (self.frame.origin.y = self.screenHeight-self.height) : (self.frame.origin.y = 0)
    }
    performSelector(#selector(hide), withObject: self, afterDelay: self.delay)
  }
  
  @objc private func addWindowSubview(view: UIView) {
    if self.superview == nil {
      let frontToBackWindows = UIApplication.sharedApplication().windows.reverse()
      for window in frontToBackWindows {
        if window.windowLevel == UIWindowLevelNormal && !window.hidden && window.frame != CGRectZero {
          window.addSubview(view)
          return
        }
      }
    }
  }
  
  @objc private func configureProperties(title: String, message: String?, textColor: UIColor?, backgroundColor: UIColor?) {
    self.title.text = title
    
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
    
    if let backgroundColor = backgroundColor {
      self.backgroundColor = backgroundColor
    }
  }
  
  // MARK: user methods, intefaces
  // title
  public func alertWithTitle(title: String) {
    
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
  
  
  public func alertWithTitle(title: String,
                             message: String,
                             textColor: UIColor,
                             backgroundColor: UIColor) {
    
    show(title,
         message: message,
         textColor: textColor,
         backgroundColor: backgroundColor)
  }
}