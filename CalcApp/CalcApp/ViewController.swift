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
    
    //compouds number and appends to array if needed
    //TODO: need to include shit that does the toggle
    func compound(incoming: String) {
        self.data.curr = self.data.curr + incoming
    }
    
    func harvest(incoming: String) {
        let num = Double(self.data.curr)
        self.data.arr.append(num!)
        self.data.curr = ""
        if incoming == "=" {
            calculate()
        } else {
            self.data.op = incoming
        }
        
    }
    
    //TODO: need to do shit that does the toggle
    func calculate() {
        //do shit
        //actually calculates
        
        //end of method
        self.data.clear()
        self.data.op = ""
    }
    
    
    
    
}

