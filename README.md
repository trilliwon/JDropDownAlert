# JDropDownAlert

[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![CI Status](http://img.shields.io/travis/Steve Jo/JDropDownAlert.svg?style=flat)](https://travis-ci.org/Steve Jo/JDropDownAlert)
[![Version](https://img.shields.io/cocoapods/v/JDropDownAlert.svg?style=flat)](http://cocoapods.org/pods/JDropDownAlert)
[![License](https://img.shields.io/cocoapods/l/JDropDownAlert.svg?style=flat)](http://cocoapods.org/pods/JDropDownAlert)
[![Platform](https://img.shields.io/cocoapods/p/JDropDownAlert.svg?style=flat)](http://cocoapods.org/pods/JDropDownAlert)
[![Issues](https://img.shields.io/github/issues/trillione/JDropDownAlert.svg?style=flat)](https://github.com/trillione/JDropDownAlert/issues?state=open)
## JDropDownALert
Simple DropDown Alert View For Any iOS Projects.

## Demo Gifs

![top alert](https://cloud.githubusercontent.com/assets/14218787/15983592/e208537c-2fe7-11e6-85d5-55ce0abfc798.gif)
![bottom alert](https://cloud.githubusercontent.com/assets/14218787/15983591/e1ec599c-2fe7-11e6-8956-54ae855d868a.gif)

# Usage

### Top

```Swift
    let alert = JDropDownAlert()
    alert.alertWith("U can use just title")
    
    alert.didTapBlock = {
      print("Top View Did Tapped")
    }
    
    let alert = JDropDownAlert()
    alert.alertWith(titleString, message: messageString)
    
    alert.didTapBlock = {
      print("Top View Did Tapped")
    }
```

### Top With Directions

```Swift
    let alert = JDropDownAlert(position: .Top, direction: .ToLeft)
    alert.alertWith(titleString, message: messageString)
    
    alert.didTapBlock = {
      print("Top View Did Tapped")
    }
    
    let alert = JDropDownAlert(position: .Top, direction: .ToRight)
    alert.alertWith(titleString, message: messageString)
    
    alert.didTapBlock = {
      print("Top View Did Tapped")
    }
```

### Bottom

```Swift
    let alert = JDropDownAlert(position: .Bottom)
    alert.alertWith(titleString, message: messageString)
    
    alert.didTapBlock = {
      print("Bottom Alert View Did Tapped")
    }
```

### Bottom With Directions
```Swift
    let alert = JDropDownAlert(position: .Bottom, direction: .ToLeft)
    alert.alertWith(titleString, message: messageString)
    
    alert.didTapBlock = {
      print("Bottom Alert View Did Tapped")
    }
    
    let alert = JDropDownAlert(position: .Bottom, direction: .ToRight)
    alert.alertWith(titleString, message: messageString)
    
    alert.didTapBlock = {
      print("Bottom Alert View Did Tapped")
    }
```

### Different Positions and Animation Directions
```Swift
  enum AlertPosition {
    case Top
    case Bottom
  }
  
  enum AnimationDirection {
    case ToLeft
    case ToRight
    case Normal
  }
```


To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Requirements

iOS 8.0 + 

## Installation

JDropDownAlert is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JDropDownAlert"
```

Add the JDropDownAlert.swift in to your project.


## Author

- Steve Jo, trilliwon.io@gmail.com
- ppth0608, ppth0608@naver.com


## License

JDropDownAlert is available under the MIT license. See the LICENSE file for more info.
