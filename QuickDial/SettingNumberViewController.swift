//
//  SettingNumberViewController.swift
//  QuickDial
//
//  Created by mac on 2016/3/28.
//  Copyright © 2016年 ssiang1627. All rights reserved.
//

import UIKit

class SettingNumberViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var phoneTextField: UITextField!

    @IBAction func backToSettingName(sender: UIButton) {
        let vc = self.navigationController?.childViewControllers[1]
        self.navigationController?.popToViewController(vc!, animated: true)
        
        
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = colorArray[selectedNumber]
        phoneTextField.becomeFirstResponder()
        phoneTextField.returnKeyType = UIReturnKeyType.Done
        if settingPhone != "" {
            phoneTextField.text = settingPhone
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if phoneTextField.text == ""{
            let myAlert = UIAlertController(title: "Ooops!", message: "Please enter phone number", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Done", style: .Default, handler: nil)
            myAlert.addAction(action)
            self.presentViewController(myAlert, animated: true, completion: nil)
        }else{
            settingPhone = phoneTextField.text
            nameArray[selectedNumber] = settingName!
            phoneArray[selectedNumber] = settingPhone!
            NSUserDefaults.standardUserDefaults().setObject(nameArray, forKey: "contactName")
            NSUserDefaults.standardUserDefaults().setObject(phoneArray, forKey: "contactPhone")
            isSetting = false
            settingPhone = nil
            settingName = nil
            self.navigationController?.popToRootViewControllerAnimated(true)

        
        }
        
        

        return true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
}
