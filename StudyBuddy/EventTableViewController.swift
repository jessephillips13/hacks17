//
//  EventTableViewController.swift
//  StudyBuddy
//
//  Created by Jesse Phillips on 9/16/17.
//  Copyright © 2017 Jesse Phillips. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var events = [Event]()
    

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

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "EventTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? EventTableViewCell else {
            fatalError("The dequeued cell is not an instance of EventTableViewCell.")
        }
        
        //Fetches the appropriate event for the data source layout
        let event = events[indexPath.row]
        
        cell.cls.text = event.cls
        cell.date.text = event.date
        cell.time.text = event.time
        cell.location.text = event.location
        cell.desc.text = event.desc

        return cell
    }
    
    //MARK: Actions
    
    @IBAction func unwindToEventList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.source as?
            EventViewController, let event = sourceViewController.event {
            
            
            //Add a new event
            let newIndexPath = IndexPath(row: events.count, section: 0)
            events.append(event)
            
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
 
    
    

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
