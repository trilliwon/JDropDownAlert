//
//  JDropDownAlert.swift
//
//  Created by Trilliwon on 2016. 4. 21..
//  Copyright (c) 2016 trilliwon <trilliwon@gmail.com> All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


import UIKit

public enum AlertPosition {
    case Top
    case Bottom
}

public enum AnimationDirection {
    case ToLeft
    case ToRight
    case Normal
}

public class JDropDownAlert: UIButton {
    
    // default values
    // You can change this values to customize
    public var height: CGFloat = 70
    public var duration: NSTimeInterval = 0.3
    public var delay: Double = 2.0
    
    private var titleFrame: CGRect!
    private var topLabel = UILabel()
    private var messageLabel = UILabel()
    
    public var position = AlertPosition.Top
    public var direction = AnimationDirection.Normal
    
    private let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
    private let screenWidth = UIScreen.mainScreen().bounds.size.width
    private let screenHeight = UIScreen.mainScreen().bounds.size.height
    
    public var titleFont:UIFont = UIFont.boldSystemFontOfSize(16) {
        didSet{
            topLabel.font = titleFont
        }
    }
    public var messageFont:UIFont = UIFont.systemFontOfSize(14) {
        didSet{
            messageLabel.font = messageFont
        }
    }
    
    public var didTapBlock: (() -> ())?
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(position: AlertPosition = .Top, direction: AnimationDirection = .Normal) {
        super.init(frame: CGRectZero)
        
        self.frame = getFrameBy(position, direction: direction)
        self.direction = direction
        self.position = position
        setDefaults()
    }
    
    
    
    private func setDefaults() {
        setTitleDefaults()
        setMessageDefaults()
        self.backgroundColor = UIColor.lightRed()
        self.addTarget(self, action: #selector(viewDidTap), forControlEvents: .TouchUpInside)
    }
    
    private func setTitleDefaults() {
        
        if self.position == .Top {
            titleFrame = CGRectMake(10, statusBarHeight, frame.size.width - 10, 20)
        }else {
            titleFrame = CGRectMake(10, 15, frame.size.width - 10, 20)
        }
        
        topLabel = UILabel(frame: titleFrame)
        topLabel.textAlignment = .Center
        topLabel.numberOfLines = 10
        topLabel.textColor = UIColor.whiteColor()
        topLabel.font = self.titleFont
        addSubview(topLabel)
    }
    
    private func setMessageDefaults() {
        let messageFrame:CGRect
        
        if self.position == .Top {
            messageFrame = CGRectMake(10, statusBarHeight + titleFrame.height + 5, frame.size.width - 10, 20)
        }else {
            messageFrame = CGRectMake(10, titleFrame.size.height + titleFrame.height, frame.size.width - 10, 20)
        }
        messageLabel = UILabel(frame: messageFrame)
        messageLabel.textAlignment = .Center
        messageLabel.lineBreakMode = .ByWordWrapping
        messageLabel.numberOfLines = 10
        messageLabel.textColor = UIColor.whiteColor()
        messageLabel.font = self.messageFont
        addSubview(messageLabel)
    }
    
    
    
    private func getFrameBy(position: AlertPosition, direction: AnimationDirection) -> CGRect {
        let frame: CGRect
        
        switch position {
        case .Top:
            frame = getFrameOfTopPositionBy(direction)
        case .Bottom:
            frame = getFrameOfBottomPositionBy(direction)
        }
        
        return frame
    }
    
    private func getFrameOfTopPositionBy(direction: AnimationDirection) -> CGRect {
        let frame: CGRect
        switch direction {
        case .ToRight:
            frame = CGRectMake(-screenWidth, 0.0, screenWidth, height)
        case .ToLeft:
            frame = CGRectMake(screenWidth, 0.0, screenWidth, height)
        case .Normal:
            frame = CGRectMake(0.0, -height, screenWidth, height)
        }
        return frame
    }
    
    private func getFrameOfBottomPositionBy(direction: AnimationDirection) -> CGRect {
        let frame: CGRect
        switch direction {
        case .ToRight:
            frame = CGRectMake(-screenWidth, screenHeight - height, screenWidth, height)
        case .ToLeft:
            frame = CGRectMake(screenWidth, screenHeight - height, screenWidth, height)
        case .Normal:
            frame = CGRectMake(0.0, screenHeight + height, screenWidth, height)
        }
        return frame
    }
    
    
    
    @objc private func viewDidTap() {
        didTapBlock?()
        hide(self)
    }
    
    
    
    // MARK: - Hub methods
    @objc private func show(title: String, message: String?, textColor: UIColor?, backgroundColor: UIColor?) {
        
        addWindowSubview(self)
        configureProperties(title, message: message, textColor: textColor, backgroundColor: backgroundColor)
        
        UIView.animateWithDuration(duration) {
            
            switch self.direction {
            case .ToRight:
                self.frame.origin.x = 0
            case .ToLeft:
                self.frame.origin.x = 0
            case .Normal:
                self.position == .Top ? (self.frame.origin.y = 0) : (self.frame.origin.y = self.screenHeight-self.height)
            }
        }
        performSelector(#selector(hide), withObject: self, afterDelay: self.delay)
    }
    
    @objc private func hide(alertView: UIButton) {
        
        UIView.animateWithDuration(duration) {
            
            switch self.direction {
            case .ToRight:
                self.frame.origin.x = -self.screenWidth
            case .ToLeft:
                self.frame.origin.x = self.screenWidth
            case .Normal:
                (self.position == .Top) ? (alertView.frame.origin.y = -self.height) : (alertView.frame.origin.y = self.screenHeight)
            }
        }
        
        performSelector(#selector(remove), withObject: alertView, afterDelay: delay)
    }
    
    
    
    @objc private func addWindowSubview(view: UIView) {
        if self.superview == nil {
            let frontToBackWindows = UIApplication.sharedApplication().windows.reverse()
            for window in frontToBackWindows {
                if window.windowLevel == UIWindowLevelNormal
                    && !window.hidden
                    && window.frame != CGRectZero {
                    window.addSubview(view)
                    return
                }
            }
        }
    }
    
    @objc private func remove(alertView: UIButton) {
        alertView.removeFromSuperview()
    }
    
    
    
    @objc private func configureProperties(title: String, message: String?, textColor: UIColor?, backgroundColor: UIColor?) {
        topLabel.text = title
        
        if let message = message {
            messageLabel.text = message
        }else {
            messageLabel.hidden = true
            topLabel.frame.origin.y = height/2
            
            if self.position == .Bottom {
                topLabel.frame.origin.y = height/2 - topLabel.frame.height/2
            }
        }
        
        if let textColor = textColor {
            topLabel.textColor = textColor
            messageLabel.textColor = textColor
        }
        
        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }
    }
    
    
    
    // MARK: Interface
    public func alertWith(title: String,
                          message: String? = nil,
                          textColor: UIColor = UIColor.whiteColor(),
                          backgroundColor: UIColor = UIColor.lightRed()) {
        self.delay = 2.0
        show(title,
             message: message,
             textColor: textColor,
             backgroundColor: backgroundColor)
    }
    
    public func alertWith(title: String,
                          message: String? = nil,
                          textColor: UIColor = UIColor.whiteColor(),
                          backgroundColor: UIColor = UIColor.lightRed(),
                          delay:Double) {
        self.delay = delay
        show(title,
             message: message,
             textColor: textColor,
             backgroundColor: backgroundColor)
    }
}


extension UIColor {
    class func lightRed() -> UIColor {
        return UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 0.9)
    }
}