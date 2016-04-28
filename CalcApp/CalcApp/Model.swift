//
//  Model.swift
//  CalcApp
//
//  Created by Evan on 4/20/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import Foundation

public class Data {
    
    public var arr : [Double] = []
    public var curr : String = ""
    public var op : String = ""
    public var toggle : Bool = false
    public var history : [String] = []
    
    public init() {
        self.arr = []
    }
    
    public func clear() {
        arr.removeAll()
    }
}