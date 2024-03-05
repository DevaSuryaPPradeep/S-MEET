//
//  timetableTableViewCell.swift
//  s-meet
//
//  Created by iroid on 17/03/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class timetableTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var room_lbl: UILabel!
    
    @IBOutlet weak var end_lbl: UILabel!
    
    @IBOutlet weak var start_lbl: UILabel!
    @IBOutlet weak var teacher_lbl: UILabel!
    @IBOutlet weak var sub_lbl: UILabel!
    @IBOutlet weak var num_lbl: UILabel!
    
    @IBOutlet weak var view_1: UIView!
    
    @IBOutlet weak var view_2: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
