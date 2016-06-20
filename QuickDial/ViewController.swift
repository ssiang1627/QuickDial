//
//  ViewController.swift
//  QuickDial
//
//  Created by mac on 2016/3/27.
//  Copyright © 2016年 ssiang1627. All rights reserved.
//

import UIKit

var colorArray:[UIColor]!
var selectedNumber:Int = -1
var nameArray = ["","","","",""]
var phoneArray = ["","","","",""]
var isSetting = false
var settingName:String?
var settingPhone:String?


class ViewController: UIViewController {

    @IBOutlet weak var button1: BigLabelButton!
    @IBOutlet weak var button2: BigLabelButton!
    @IBOutlet weak var button3: BigLabelButton!
    @IBOutlet weak var button4: BigLabelButton!
    @IBOutlet weak var button5: BigLabelButton!
    
    var buttonArray:[BigLabelButton]!
    var viewWidth:CGFloat!
    var viewHeight:CGFloat!
    
    var colorPressArray:[UIColor]!
    
    
    @IBAction func buttonTouched(sender: BigLabelButton) {
        let buttonNumber = sender.tag - 100
        buttonArray[buttonNumber].backgroundColor = colorPressArray[buttonNumber]
        buttonArray[buttonNumber].bigLabel.textColor = colorPressArray[5]
    }
    
    
    @IBAction func pressEnded(sender: BigLabelButton) {
        let buttonNumber = sender.tag - 100
        buttonArray[buttonNumber].backgroundColor = colorArray[buttonNumber]
        buttonArray[buttonNumber].bigLabel.textColor = colorArray[5]
        
        let thisName:String? = nameArray[buttonNumber]
        let thisNumber:String? = phoneArray[buttonNumber]
        if thisName != nil{
            if UIApplication.sharedApplication().canOpenURL(NSURL(string: "tel://\(thisNumber!)")!) == true {
                let url = NSURL(string: "tel://\(thisNumber!)")
                UIApplication.sharedApplication().openURL(url!)
                
            }
        }
    
    
    
    
    
    }
    @IBAction func ousideEnded(sender: BigLabelButton) {
        let buttonNumber = sender.tag - 100
        buttonArray[buttonNumber].backgroundColor = colorArray[buttonNumber]
        buttonArray[buttonNumber].bigLabel.textColor = colorArray[5]
    }
    
    override func viewWillAppear(animated: Bool) {
        isSetting = false
        settingName = nil
        settingPhone = nil
        
        
        for var i = 0; i<buttonArray.count; i++ {
            buttonArray[i].backgroundColor = colorArray[i]
            buttonArray[i].bigLabel.textColor = colorArray[5]
            
        }
        
        
        
        var isEmpty = true
        for var i = 1; i<5 ; i++ {
            if nameArray[i] != "" {
                isEmpty = false
            }
        }
        
        
        if isEmpty == true {
            for var i = 0 ; i < 5 ; i++ {
                buttonArray[i].bigLabel.text = ""
                buttonArray[i].bigLabel.hidden = true
                
            }
            buttonArray[1].bigLabel.text = "Long Press"
            buttonArray[1].bigLabel.hidden = false
        }else{
            for var i = 0 ; i < 5 ; i++ {
                if nameArray[i] != "" {
                    buttonArray[i].bigLabel.text = nameArray[i]
                    buttonArray[i].bigLabel.hidden = false
                    
                }else{
                    buttonArray[i].bigLabel.hidden = true
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWidth = view.frame.size.width
        viewHeight = view.frame.size.height
        buttonArray = [button1,button2,button3,button4,button5]
        
        for var i=0 ; i<buttonArray.count; i++ {
            buttonArray[i].bigLabel.frame = CGRectMake(28,0,viewWidth-38 , viewHeight/5)
            buttonArray[i].bigLabel.font = UIFont(name: "Arial-BoldMT", size: 45*(viewHeight/600))
            let longPressGestureRecongizer = UILongPressGestureRecognizer(target: self, action: Selector("longPress:"))
            longPressGestureRecongizer.minimumPressDuration = 1.5
            buttonArray[i].addGestureRecognizer(longPressGestureRecongizer)

        }
        
        
        
        colorArray=[
            UIColor(red: 232/255, green: 68/255, blue: 32/255, alpha: 1),
            UIColor(red: 250/255, green: 168/255, blue: 8/255, alpha: 1),
            UIColor(red: 2/255, green: 160/255, blue: 131/255, alpha: 1),
            UIColor(red: 9/255, green: 171/255, blue: 219/255, alpha: 1),
            UIColor(red: 3/255, green: 127/255, blue: 208/255, alpha: 1),
            UIColor.whiteColor()
        ]
        
        colorPressArray=[
            UIColor(red: 202/255, green: 38/255, blue: 1/255, alpha: 1),
            UIColor(red: 220/225, green: 138/255 , blue: 0, alpha: 1),
            UIColor(red: 0, green: 130/255, blue: 101/255, alpha: 1),
            UIColor(red: 0, green: 141/255, blue: 189/255, alpha: 1),
            UIColor(red: 0, green: 97/255, blue: 178/255, alpha: 1),
            UIColor.grayColor()

        ]
        
        
        if NSUserDefaults.standardUserDefaults().objectForKey("contactName") != nil {
            nameArray.removeAll(keepCapacity: true)
            nameArray = NSUserDefaults.standardUserDefaults().objectForKey("contactName") as! Array
            
            
        }
        
        if NSUserDefaults.standardUserDefaults().objectForKey("contactPhone") != nil {
            phoneArray.removeAll(keepCapacity: true)
            phoneArray = NSUserDefaults.standardUserDefaults().objectForKey("contactPhone") as! Array

        }
        
        
        
        
        
    }
    
    
    func longPress(sender:UILongPressGestureRecognizer){
        if sender.state == .Began{
            selectedNumber = sender.view!.tag-100
            if nameArray[selectedNumber] != ""{
                self.performSegueWithIdentifier("showChooseDelete", sender: nil)
            }else{
            self.performSegueWithIdentifier("showSettingName", sender: nil)
            }
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class BigLabelButton:UIButton{
  let bigLabel =  UILabel()
    
    
    required init? (coder aDecoder:NSCoder){
        super.init(coder :aDecoder)
        bigLabel.text="Long Press"
        bigLabel.textColor = UIColor.whiteColor()
        bigLabel.shadowColor = UIColor.blackColor()
        self.addSubview(bigLabel)
        
    
    
    }
    
    
}

