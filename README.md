# JDropDownAlert

#####Inspiration from RKDropDownAlert

## Demo

```Swift
JDropDownAlert.setDropDownAlertTextFont("AppleSDGothicNeo-Bold", titleFontSize: 15, messageFontName: "AppleSDGothicNeo-Medium", messageFontSize: 10)

JDropDownAlert.alertWithTitle("Hey, Beautiful!",
                                    message: "Could you pass me a bottle of water?",
                                    backgroundColor: UIColor.blackColor(),
                                    delay: nil,
                                    duration: nil,
                                    height: 70)
```

![alt tag](https://cloud.githubusercontent.com/assets/14218787/14765818/5c6ef696-0a2e-11e6-8d2d-3769e56bc094.gif)
![alt tag](https://cloud.githubusercontent.com/assets/14218787/14765788/a2535a14-0a2c-11e6-8b4f-3a531432bc3a.gif)

## Usage

```Swift
public class func alertWithTitle(title: String,
                            delay: Double?,
                            duration: Double?,
                            height: CGFloat?)
                            
public class func alertWithTitle(title: String,
                            textColor: UIColor,
                            delay: Double?,
                            duration: Double?,
                            height: CGFloat?)
                            
public class func alertWithTitle(title: String,
                            backgroundColor: UIColor,
                            delay: Double?,
                            duration: Double?,
                            height: CGFloat?)
public class func alertWithTitle(title: String,
                            message: String,
                            delay: Double?,
                            duration: Double?,
                            height: CGFloat?)
                            
public class func alertWithTitle(title: String,
                            message: String,
                            textColor: UIColor,
                            delay: Double?,
                            duration: Double?,
                            height: CGFloat?)
                            
public class func alertWithTitle(title: String,
                            message: String,
                            backgroundColor: UIColor,
                            delay: Double?,
                            duration: Double?,
                            height: CGFloat?)
                            
public class func setDropDownAlertTextFont(titleFontName: String,
                                      titleFontSize: CGFloat,
                                      messageFontName: String,
                                      messageFontSize: CGFloat)
```
Download and add the JDropDownAlert.swift file to your project.

## Author

trillione, trillione1024@gmail.com

## License

JDropDownAlert is available under the MIT license. See the LICENSE file for more info.
