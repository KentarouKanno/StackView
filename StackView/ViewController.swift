//
//  ViewController.swift
//  StackView
//
//  Created by KentarOu on 2016/02/20.
//  Copyright © 2016年 KentarOu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // First TextView
    @IBOutlet weak var firstTextView: UITextView!
    
    // Change Switch
    @IBAction func didChangeValue(sender: UISwitch) {
        
        UIView.animateWithDuration(0.3) {
            self.firstTextView.hidden = !sender.on
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

