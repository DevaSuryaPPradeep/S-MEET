//
//  assignedleaveTableViewCell.swift
//  s-meet
//
//  Created by Netcom on 17/05/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class assignedleaveTableViewCell: UITableViewCell {

    @IBOutlet weak var assignview: UIView!
    
    @IBOutlet weak var cat_lbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
