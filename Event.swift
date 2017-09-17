//
//  Event.swift
//  StudyBuddy
//
//  Created by Jesse Phillips on 9/16/17.
//  Copyright © 2017 Jesse Phillips. All rights reserved.
//

import Foundation
import UIKit

class Event {
    
    //MARK: Properties
    
    var eventId: String
    var cls: String
    var date: String
    var time: String
    var location: String
    var desc: String
    
    //MARK: Initialization
    
    init?(cls: String, date: String, time: String, location: String, desc: String) {
        
        //Initialization should fail if any of the fields are empty

        if (cls.isEmpty || date.isEmpty || time.isEmpty || location.isEmpty || desc.isEmpty) {
            return nil
        }
        
        //Initialize properties
        self.eventId = String()
        self.cls = cls
        self.date = date
        self.time = time
        self.location = location
        self.desc = desc
        
        
        
        
    }
    
    
}
