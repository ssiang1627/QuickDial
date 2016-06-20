//
//  SettingNameViewController.swift
//  QuickDial
//
//  Created by mac on 2016/3/28.
//  Copyright © 2016年 ssiang1627. All rights reserved.
//

import UIKit

class SettingNameViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        self.view.backgroundColor = colorArray[selectedNumber]
        nameTextField.autocorrectionType = UITextAutocorrectionType.No
        nameTextField.returnKeyType = UIReturnKeyType.Next
        nameTextField.becomeFirstResponder()
        
        isSetting = true
        
        if settingPhone != "" {
            nameTextField.text = settingName
        }
    }
    
    @IBAction func backToMain(sender: UIButton) {
        if settingName != nil{
            settingName = nil
            settingPhone = nil
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if nameTextField.text == ""{
            let myAlert = UIAlertController(title: "Ooops!", message: "Please enter a contact name", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Done", style: .Default, handler: nil)
            myAlert.addAction(action)
            self.presentViewController(myAlert, animated: true, completion: nil)
        }else{
            settingName = nameTextField.text
            self.performSegueWithIdentifier("showSettingNumber", sender: nil)
        }
        
        
        
        return true
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
