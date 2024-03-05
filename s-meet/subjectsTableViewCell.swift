//
//  subjectsTableViewCell.swift
//  s-meet
//
//  Created by Netcom on 18/05/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class subjectsTableViewCell: UITableViewCell {
    @IBOutlet weak var code_lbl: UILabel!
    
    @IBOutlet weak var division_lbl: UILabel!
    @IBOutlet weak var class_lb: UILabel!
    @IBOutlet weak var subject_view: UIView!
    
    @IBOutlet weak var subject_name: UILabel!
    
    @IBOutlet weak var teacher: UILabel!
    
    
    @IBOutlet weak var author_lbl: UILabel!
    
    @IBOutlet weak var pass_lbl: UILabel!
    
    @IBOutlet weak var final_lbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
