//
//  EventViewController.swift
//  StudyBuddy
//
//  Created by Jesse Phillips on 9/16/17.
//  Copyright © 2017 Jesse Phillips. All rights reserved.
//

import UIKit
import os.log


class EventViewController: UIViewController {

    @IBOutlet weak var classPicker: UIPickerView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var desc: UITextField!
    
    var event : Event?

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Navigation
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        super.prepare(for: segue, sender: sender)
        
        //Configure the destination view controller only when the save button is pressed
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            
            os_log("The Save Button was not pressed", log: OSLog.default, type: .debug)
            return
         }
        
        let cl = classPicker.description
        let date = datePicker.description
        let time = timePicker.description
        let loc = location.description
        let des = desc.description
        
        //Set the event that will be passed to the TableViewController after the unwind segue.
        
        event = Event(cls: cl, date: date, time: time, location: loc, desc: des)
        
        
    }


   
    
}


        
        
        
    
    
    



