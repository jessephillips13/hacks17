//
//  ViewController.swift
//  StudyBuddy
//
//  Created by Jesse Phillips on 9/16/17.
//  Copyright © 2017 Jesse Phillips. All rights reserved.
//

import Foundation
import AWSCore
import AWSDynamoDB
import UIKit
import AWSAuthCore


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveEvent(_ sender: Any) {
        
        let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
        
        //Create data object using data models you downloaded from Mobile Hub
        let eventsItem: Events = Events();
        
        eventsItem._id =  "1"
        eventsItem._class = "cs2800"
        eventsItem._date = "today"
        eventsItem._description = "lolbro"
        eventsItem._location = "hereNnow"
        eventsItem._maxNum = 2
        eventsItem._participants = ["me"]
        eventsItem._time = "likern"
        
        print("Data object populated")
        
        //Save a new item
        dynamoDbObjectMapper.save(eventsItem, completionHandler: {
            (error: Error?) -> Void in
            
            if let error = error {
                print("Amazon DynamoDB Save Error: \(error)")
                return
            }
            print("An item was saved.")
        })
    }
    
    @IBAction func makeQuery(_ sender: Any) {
        // 1) Configure the query
        
        let queryExpression = AWSDynamoDBQueryExpression()
        
        queryExpression.keyConditionExpression = "#class = :class AND #id = :id"
        
        //queryExpression.filterExpression = "#author = :author"
        queryExpression.expressionAttributeNames = [
            "#class": "class",
            "#id": "id"
        ]
        queryExpression.expressionAttributeValues = [
            ":class": "cs2800",
            ":id": "1"
        ]
        
        // 2) Make the query
        
        let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
        
        dynamoDbObjectMapper.query(Events.self, expression: queryExpression) { (output: AWSDynamoDBPaginatedOutput?, error: Error?) in
            if error != nil {
                print("The request failed. Error: \(String(describing: error))")
            }
            if output != nil {
                for event in output!.items {
                    let eventItem = event as? Events
                    print("\(eventItem!._id!)")
                }
            }
        }
    }
    
    
    


}

