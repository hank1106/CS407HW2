//
//  EventsTableViewController.swift
//  CalendarTable
//
//  Created by Zihan Zhang on 3/8/16.
//  Copyright © 2016 Zihan Zhang. All rights reserved.
//

import UIKit
import CoreData

class EventsTableViewController: UITableViewController {

    var events = [AnyObject]()
    var day = Int()
    var month = Int()
    
    

    
    @IBAction func addButtonPressed(sender : UIBarButtonItem){
        let defaultDate = "\(month)-\(day)"
        
        let alert = UIAlertController(title: "Add Event", message: "\(month)-\(day)", preferredStyle: .Alert)
        
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.text = ""
        })
        
        let MyCancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) {
            // Handle Cancel Logic here - when user press cancel button, like
            action in self.dismissViewControllerAnimated(true, completion: nil)
        }
        alert.addAction(MyCancelAction)

        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            let textField = alert.textFields![0] as UITextField
            let event = Event(withTitle: textField.text!, andDate: defaultDate)
            let encodedEvent = NSKeyedArchiver.archivedDataWithRootObject(event)
            self.events.append(encodedEvent)
            NSUserDefaults.standardUserDefaults().setObject(self.events, forKey: defaultDate)
            NSUserDefaults.standardUserDefaults().synchronize()
            self.tableView.reloadData()
        }))
        self.presentViewController(alert, animated: true, completion: nil)
        
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let defaultsDate = "\(month)-\(day)"
        let eventsArray = NSUserDefaults.standardUserDefaults().arrayForKey(defaultsDate)
        if let eventsArray = eventsArray{
            events = eventsArray
        }
        return events.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("event", forIndexPath: indexPath)
        if let eventObj = events[indexPath.row] as? NSData {
            let event = NSKeyedUnarchiver.unarchiveObjectWithData(eventObj) as! Event
            cell.textLabel?.text = event.title
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        //let storyboard = UIStoryboard(name: "storyboard", bundle: nil);
        //let days = storyboard.instantiateViewControllerWithIdentifier("DaysTableViewController") as! UITableViewController
        //let destinationVC:DaysTableViewController = DaysTableViewController()
        
        self.performSegueWithIdentifier("toAdd", sender: nil)
    }


    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            events.removeAtIndex(indexPath.row)
            
            let defaultsDate = "\(month)-\(day)"
            NSUserDefaults.standardUserDefaults().setObject(events, forKey: defaultsDate)
            NSUserDefaults.standardUserDefaults().synchronize()
            let section = NSIndexSet(index:0)
            tableView.reloadSections(section,withRowAnimation: .Fade)
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
}
