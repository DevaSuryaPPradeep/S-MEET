//
//  examscheduleTableViewCell.swift
//  s-meet
//
//  Created by Netcom on 26/04/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class examscheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var exam_view: UIView!
    
    @IBOutlet weak var exam_btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
