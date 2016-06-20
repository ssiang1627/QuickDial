//
//  ChooseDeleteViewController.swift
//  QuickDial
//
//  Created by mac on 2016/3/28.
//  Copyright © 2016年 ssiang1627. All rights reserved.
//

import UIKit

class ChooseDeleteViewController: UIViewController {
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = colorArray[selectedNumber]
        
    }
    
    @IBAction func backToMain(sender: UIButton) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    
    }
    
    @IBAction func deleteThisEntry(sender: UIButton) {
        nameArray[selectedNumber] = ""
        phoneArray[selectedNumber] = ""
        NSUserDefaults.standardUserDefaults().setObject(nameArray, forKey: "contactName")
        NSUserDefaults.standardUserDefaults().setObject(phoneArray, forKey: "contactPhone")
        settingName = nil
        settingPhone = nil
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    @IBAction func editThisEntry(sender: UIButton) {
        settingName = nameArray[selectedNumber]
        settingPhone = phoneArray[selectedNumber]
        
        self.performSegueWithIdentifier("edit", sender: nil)
    
    
    }

    


}

