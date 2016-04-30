//
//  VCs.swift
//  CalcApp
//
//  Created by Evan on 4/29/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import Foundation

import UIKit

class HistoryVC : UIViewController {
    var data : Data!
    
    @IBOutlet weak var historyInfo: UILabel!
    
    var v : UIView!
    //i have no idea how to do scrollview this is really tilting
    
    //when gets to this builder area, just forloop through all of the items in history and then 
    //put them into the scrollview
    
    func builder() {
        if v == nil {
            v = UIView.init(frame: CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 300, height: 300))
            
            self.view.addSubview(v)
        }
        for i in 0..<self.data.history.count {
            //let label = UILabel.init(frame: CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 300, height: 100))
            //label.text = thing
            //self.v.addSubview(label)
            if historyInfo.text != "" {
                historyInfo.text = "\(historyInfo.text!) ~~ \(self.data.history[i])"
            } else {
                historyInfo.text = "\(self.data.history[i])"
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        builder()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toCalc") {
            let toCalc = segue.destinationViewController as! ViewController
            
            toCalc.data = self.data
            
        }
    }
    
    
}