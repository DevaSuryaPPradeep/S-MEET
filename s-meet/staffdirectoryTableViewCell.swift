//
//  staffdirectoryTableViewCell.swift
//  s-meet
//
//  Created by iroid on 15/03/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class staffdirectoryTableViewCell: UITableViewCell {

    @IBOutlet weak var teachers_label: UILabel!
    @IBOutlet weak var sub_label: UILabel!
    @IBOutlet weak var staff_view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
