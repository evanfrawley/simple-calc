//
//  ViewController.swift
//  CalcApp
//
//  Created by Evan on 4/20/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var data = Data()
    private var historyVC : HistoryVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        harvest("+")
    }
    
    @IBAction func subtract(sender: AnyObject) {
        harvest("-")
    }
    
    @IBAction func multiply(sender: AnyObject) {
        harvest("*")
    }
    
    @IBAction func divide(sender: AnyObject) {
        harvest("/")
    }
    
    @IBAction func mod(sender: AnyObject) {
        harvest("%")
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
        
        if oper == "+" { // add
            total = self.data.arr[0] + self.data.arr[1]
            
        } else if oper == "-" { // sub
            total = self.data.arr[0] - self.data.arr[1]
            
        } else if oper == "*" { //mul
            total = self.data.arr[0] * self.data.arr[1]
            
        } else if oper == "/" {//div
            total = self.data.arr[0] / self.data.arr[1]
            
        } else if oper == "%" { //mod
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
        let histItem = "\(String(self.currentLabel.text!))=\(String(self.resultLabel.text!))"
        self.data.history.append(histItem)
        //end of method
        self.data.clear()
        self.currentLabel.text = ""
        self.data.op = ""
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toHistory") {
            let toHistory = segue.destinationViewController as! HistoryVC
            
            toHistory.data = self.data
            
        }
    }
    
}

