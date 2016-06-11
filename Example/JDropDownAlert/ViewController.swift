//
//  ViewController.swift
//  JDropDownAlert
//
//  Created by Trillione on 2016. 4. 21..
//  Copyright © 2016년 Trillione. All rights reserved.
//

import UIKit
import JDropDownAlert

class ViewController: UIViewController {
  
  let titleString = "What's up?"
  let messageString = "Could you pass me a bottle of water?"
  
  
  @IBAction func topAlertAction() {
    
    let alert = JDropDownAlert()
    alert.alertWith("U can use just title")
    alert.didTapBlock = {
      print("Top View Did Tapped")
    }
  }
  
  @IBAction func topToLeftAlertAction() {
    let alert = JDropDownAlert(position: .Top, direction: .ToLeft)
    alert.alertWith(titleString, message: messageString)
    
    alert.didTapBlock = {
      print("Top View Did Tapped")
    }
  }
  
  @IBAction func topToRightAlertAction() {
    let alert = JDropDownAlert(position: .Top, direction: .ToRight)
    alert.alertWith(titleString, message: messageString)
    
    alert.didTapBlock = {
      print("Top View Did Tapped")
    }
  }
  
  
  @IBAction func bottomAlertAction() {
    let alert = JDropDownAlert(position: .Bottom)
    alert.alertWith(titleString, message: messageString)
    
    alert.didTapBlock = {
      print("Bottom Alert View Did Tapped")
    }
  }
  
  @IBAction func bottomToLeftAlertAction() {
    let alert = JDropDownAlert(position: .Bottom, direction: .ToLeft)
    alert.alertWith(titleString, message: messageString)
    
    alert.didTapBlock = {
      print("Bottom Alert View Did Tapped")
    }
  }
  
  @IBAction func bottomToRightAlertAction() {
    let alert = JDropDownAlert(position: .Bottom, direction: .ToRight)
    alert.alertWith(titleString, message: messageString)
    
    alert.didTapBlock = {
      print("Bottom Alert View Did Tapped")
    }
  }
}

