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
  }
  
  @IBAction func alertAction(sender: AnyObject) {
    let alert = JDropDownAlert(type: .Top)
    alert.alertWithTitle("Hey, Beautiful!", message: "Could you pass me a bottle of water?")
    
    alert.didTapBlock = {
      print("View Did Tapped")
    }
  }
  
  @IBAction func bottomAlertAction(sender: AnyObject) {
    let alert = JDropDownAlert(type: .Bottom)
    alert.alertWithTitle("Hey, Beautiful!", message: "Could you pass me a bottle of water?")
    
    alert.didTapBlock = {
      print("View Did Tapped")
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

