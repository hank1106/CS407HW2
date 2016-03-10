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

    var events = [String]()
    var day = Int()
    var month = Int()
    var test = String()
    
    

    
    @IBAction func addButtonPressed(sender : UIBarButtonItem){
        let newEvent = "Test Event "
        events.append(newEvent)
        tableView.reloadData()
        
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
        return events.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("event", forIndexPath: indexPath)
        let event = events[indexPath.row]
        cell.textLabel?.text = event
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
            let section = NSIndexSet(index:0)
            tableView.reloadSections(section,withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "toAdd") {
            let vc:AddEventViewController = segue.destinationViewController as! AddEventViewController
            vc.month = month
            vc.day = day
        }

    }

}
