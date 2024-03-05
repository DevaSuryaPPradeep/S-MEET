//
//  noticeTableViewCell.swift
//  s-meet
//
//  Created by Netcom on 21/03/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class noticeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title_lbl: UILabel!
    
    @IBOutlet weak var description_lbl: UITextField!
    
    @IBOutlet weak var notice_view: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
