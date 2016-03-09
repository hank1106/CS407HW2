//
//  Event.swift
//  CalendarTable
//
//  Created by Zihan Zhang on 3/8/16.
//  Copyright © 2016 Zihan Zhang. All rights reserved.
//

import Foundation
import CoreData


class Event: NSManagedObject {

        @NSManaged var month: String
        @NSManaged var day: String
        @NSManaged var title: String

}
