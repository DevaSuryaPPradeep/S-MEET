//
//  requestbookTableViewCell.swift
//  s-meet
//
//  Created by Netcom on 26/04/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class requestbookTableViewCell: UITableViewCell {
    @IBOutlet weak var book_view: UIView!
    
    @IBOutlet weak var price_lbl: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var author_name: UILabel!
    @IBOutlet weak var book_name: UILabel!
    @IBOutlet weak var status_lbl: UILabel!
    
    @IBOutlet weak var request_btn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
