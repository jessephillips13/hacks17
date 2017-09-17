//
//  EventTableViewCell.swift
//  StudyBuddy
//
//  Created by Jesse Phillips on 9/16/17.
//  Copyright © 2017 Jesse Phillips. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var eventId: UITextField!
    @IBOutlet weak var cls: UITextView!
    @IBOutlet weak var date: UITextView!
    @IBOutlet weak var time: UITextView!
    @IBOutlet weak var location: UITextView!
    @IBOutlet weak var desc: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
