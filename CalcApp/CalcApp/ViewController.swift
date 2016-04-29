//
//  ViewController.swift
//  CalcApp
//
//  Created by Evan on 4/20/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    let data = Data()
    private var historyVC : HistoryVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func builder() {
        if historyVC == nil {
            historyVC =
                storyboard?
                    .instantiateViewControllerWithIdentifier("History")
                as! HistoryVC
            NSLog("Created")
        }
    }
    
    @IBOutlet weak var history: UIScrollView!
    
    @IBOutlet weak var test123: UILabel!
    
    @IBOutlet weak var vv: UIView!
    
    var i : Int = 0
    var label: UILabel!
    var v : UIView!
    func viewSetup() {
        history = UIScrollView.init(frame: CGRect(x: 100, y: 100, width: 240, height: 200))
        v = UIView.init(frame: CGRect(x: 10, y: 10, width: 240, height: 100))
        self.view.addSubview(v)
    }
    
    func labelSetup() {
        if v == nil {
            viewSetup()
        }
        builder()
        label = UILabel.init(frame: CGRect(x: 0, y: CGFloat(i * 20), width: 240, height: 20))
        label.text = "Test"
        
        historyVC.view.addSubview(label)
        i = i + 1
    
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var currentLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    //why the fuck do we need 21 buttons T_T
    
    @IBAction func one(sender: AnyObject) {
        compound("1")
    }

    @IBAction func two(sender: AnyObject) {
        compound("2")
    }
    
    @IBAction func three(sender: AnyObject) {
        compound("3")
    }
    
    @IBAction func four(sender: AnyObject) {
        compound("4")
    }
    
    @IBAction func five(sender: AnyObject) {
        compound("5")
    }
    
    @IBAction func six(sender: AnyObject) {
        compound("6")
    }
    
    @IBAction func seven(sender: AnyObject) {
        compound("7")
    }
    
    @IBAction func eight(sender: AnyObject) {
        compound("8")
    }
    
    @IBAction func nine(sender: AnyObject) {
        compound("9")
    }
    
    @IBAction func zero(sender: AnyObject) {
        compound("0")
    }
    
    @IBAction func decimal(sender: AnyObject) {
        compound(".")
    }
    
    @IBAction func enter(sender: AnyObject) {
        harvest("enter")
    }
    
    @IBAction func RPNToggle(sender: AnyObject) {
        self.data.toggle = !self.data.toggle
    }
   
    @IBAction func add(sender: AnyObject) {
        harvest("add")
    }
    
    @IBAction func subtract(sender: AnyObject) {
        harvest("sub")
    }
    
    @IBAction func multiply(sender: AnyObject) {
        harvest("mul")
    }
    
    @IBAction func divide(sender: AnyObject) {
        harvest("div")
    }
    
    @IBAction func mod(sender: AnyObject) {
        harvest("mod")
    }
    
    @IBAction func equals(sender: AnyObject) {
        harvest("=")
    }
    
    @IBAction func avg(sender: AnyObject) {
        harvest("avg")
    }
    
    @IBAction func count(sender: AnyObject) {
        harvest("count")
    }
    
    @IBAction func fact(sender: AnyObject) {
        harvest("fact")
    }
    
    @IBAction func showHistoryu(sender: AnyObject) {
        labelSetup()
    }
    
    
    //compouds number and appends to array if needed
    //TODO: need to include shit that does the toggle
    func compound(incoming: String) {
        self.resultLabel.text = ""
        self.data.curr = self.data.curr + incoming
        self.currentLabel.text = self.currentLabel.text! + incoming
    }
    
    func harvest(incoming: String) {
        if self.data.curr != "" {
            let num : Double = Double(self.data.curr)!
            self.data.arr.append(num)
        }
        self.data.curr = ""
        
        if incoming != "=" {
            self.data.op = incoming
            self.currentLabel.text = self.currentLabel.text! + incoming
        } else {
            calculate()
        }
        
    }
    
    
    
    //TODO: need to do shit that does the toggle
    func calculate() {
        //do shit
        //actually calculates
        
        let oper = self.data.op
        var total : Double = 0
        
        if oper == "add" { // add
            total = self.data.arr[0] + self.data.arr[1]
            
        } else if oper == "sub" { // sub
            total = self.data.arr[0] - self.data.arr[1]
            
        } else if oper == "mul" { //mul
            total = self.data.arr[0] * self.data.arr[1]
            
        } else if oper == "div" {//div
            total = self.data.arr[0] / self.data.arr[1]
            
        } else if oper == "mod" { //mod
            total = self.data.arr[0] % self.data.arr[1]
            
        } else if oper == "avg" { //avg
            for num in self.data.arr {
                total = total + num
            }
            total = total / Double(self.data.arr.count)
            
        } else if oper == "count" { //count
            total = Double(self.data.arr.count)
            
        } else if oper == "fact" { // fact
            var start = Int(self.data.arr[0])
            total = Double(start)
            start = start - 1
            while start > 0 {
                total = total * Double(start)
                start = start - 1
            }
        }
        
        self.resultLabel.text = String(total)
        
        //end of method
        self.data.clear()
        self.currentLabel.text = ""
        self.data.op = ""
    }
    
    
    
    
}

