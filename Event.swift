//
//  Event.swift
//  CalendarTable
//
//  Created by Zihan Zhang on 3/8/16.
//  Copyright © 2016 Zihan Zhang. All rights reserved.
//

import Foundation

class Event{
    var title: String = ""
    var month: String = ""
    var day: String = ""
    init? (title: String, month: String, day:String) {
        self.title = title
        self.month = month
        self.day = day
        
        
    }
    
}