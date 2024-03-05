//
//  sidemenuTableViewCell.swift
//  s-meet
//
//  Created by iroid on 13/03/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class sidemenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbl_1: UILabel!
    
    @IBOutlet weak var menu_imgview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
