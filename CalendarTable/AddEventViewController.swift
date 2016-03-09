//
//  AddEventViewController.swift
//  CalendarTable
//
//  Created by Zihan Zhang on 3/8/16.
//  Copyright © 2016 Zihan Zhang. All rights reserved.
//

import UIKit
import CoreData

class AddEventViewController: UIViewController {
    var month = Int()
    var day = Int()
    let managedObjectContext =
    (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext
    
    @IBOutlet weak var TextTitle: UITextField!
    
    
    @IBAction func save(sender: AnyObject) {
        let entityDescription =
        NSEntityDescription.entityForName("Event",
            inManagedObjectContext: managedObjectContext)
        
        let event = Event(entity: entityDescription!,
            insertIntoManagedObjectContext: managedObjectContext)
        
        event.setValue(month, forKey: "month")
        event.setValue(day, forKey: "day")
        event.setValue(title, forKey: "title")
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
