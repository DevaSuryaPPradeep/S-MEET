//
//  leaveapplicationTableViewCell.swift
//  s-meet
//
//  Created by iroid on 16/03/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class leaveapplicationTableViewCell: UITableViewCell {
    @IBOutlet weak var status_lbl: UILabel!
    @IBOutlet weak var reason_txtview: UITextView!
    
    @IBOutlet weak var days_txt: UITextField!
    
    @IBOutlet weak var annual_txt: UITextField!
    
    @IBOutlet weak var name_txt: UITextField!
    
    @IBOutlet weak var applydate_lbl: UILabel!
    
    @IBOutlet weak var applydate_txt: UITextField!
    
    @IBOutlet weak var browse_btn: UIButton!
    @IBOutlet weak var delete_btn: UIButton!
    @IBOutlet weak var edit_btn: UIButton!
    @IBOutlet weak var leave_view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
