//
//  assignmentTableViewCell.swift
//  s-meet
//
//  Created by iroid on 14/03/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class assignmentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var date_lbl: UILabel!
    
    @IBOutlet weak var note_lbl: UILabel!
    @IBOutlet weak var edit_btn: UIButton!
    @IBOutlet weak var delete_btn: UIButton!
    @IBOutlet weak var num_lbl: UILabel!
    @IBOutlet weak var assign_view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
