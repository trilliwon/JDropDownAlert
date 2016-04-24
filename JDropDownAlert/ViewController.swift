//
//  ViewController.swift
//  JDropDownAlert
//
//  Created by Trillione on 2016. 4. 21..
//  Copyright © 2016년 Trillione. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    JDropDownAlert.setDropDownAlertTextFont("AppleSDGothicNeo-Bold", titleFontSize: 15, messageFontName: "AppleSDGothicNeo-Medium", messageFontSize: 10)
  }
  
  
  @IBAction func alertAction(sender: AnyObject) {
    
    JDropDownAlert.alertWithTitle("Hey, Beautiful!",
                                  message: "Could you pass me a bottle of water?",
                                  backgroundColor: UIColor.blackColor(),
                                  delay: nil,
                                  duration: nil,
                                  height: 70)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

