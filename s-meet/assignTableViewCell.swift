//
//  assignTableViewCell.swift
//  s-meet
//
//  Created by Netcom on 24/04/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class assignTableViewCell: UITableViewCell {
    @IBOutlet weak var assign_view: UIView!
    @IBOutlet weak var division_lbl: UILabel!
    
    @IBOutlet weak var class_lbl: UILabel!
    @IBOutlet weak var date_lbl: UILabel!
    @IBOutlet weak var cat_lbl: UILabel!
    
    @IBOutlet weak var year_lbl: UILabel!
    
    
    @IBOutlet weak var subject_lbl: UILabel!
    
    @IBOutlet weak var description_txtview: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
