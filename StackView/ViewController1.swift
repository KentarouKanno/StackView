//
//  ViewController1.swift
//  StackView
//
//  Created by KentarOu on 2016/02/20.
//  Copyright © 2016年 KentarOu. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    

    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var subStackView1: UIStackView!
    @IBOutlet weak var subStackView2: UIStackView!
    
    @IBAction func segmentedControlChangeHandler(sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex
        
        var togglingView = index <= 2 ? subStackView1.arrangedSubviews[index] : subStackView2.arrangedSubviews[index - 3]
        // var togglingView = index <= 3 ? subStackView1.arrangedSubviews[index] : subStackView2.arrangedSubviews[index - 3]
        
        // ↓この処理はアニメーションを制御する為なので無くてもOK、消す場合↑の処理を有効にする
        if subStackView2.arrangedSubviews.contains(togglingView) {
            
            if subStackView1.arrangedSubviews[3].hidden {
                
                togglingView.hidden = !togglingView.hidden
                togglingView = subStackView1.arrangedSubviews[3]
            } else {
                
                togglingView.hidden = !togglingView.hidden
                if (subStackView2.arrangedSubviews.filter{ $0.hidden == true }.count == subStackView2.arrangedSubviews.count) {
                    
                    if (subStackView1.arrangedSubviews.filter{ $0.hidden == true }.count == subStackView1.arrangedSubviews.count - 1) {

                        togglingView.hidden = !togglingView.hidden
                        
                        UIView.animateWithDuration(0.25) {
                            togglingView.hidden = !togglingView.hidden
                        }
                    }
                    
                    togglingView = subStackView1.arrangedSubviews[3]
                } else {
                    togglingView.hidden = !togglingView.hidden
                }
            }
        }
        // ↑
        
        UIView.animateWithDuration(0.25) {
            togglingView.hidden = !togglingView.hidden
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
                
        dispatch_async(dispatch_get_main_queue()) {
            
            if self.view.frame.height > self.view.frame.width {
                self.subStackView1.axis = UILayoutConstraintAxis.Vertical
                self.subStackView2.axis = UILayoutConstraintAxis.Horizontal
            } else {
                
                self.subStackView1.axis = UILayoutConstraintAxis.Horizontal
                self.subStackView2.axis = UILayoutConstraintAxis.Vertical
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
