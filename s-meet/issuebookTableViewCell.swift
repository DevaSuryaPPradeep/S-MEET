//
//  issuebookTableViewCell.swift
//  s-meet
//
//  Created by Netcom on 18/05/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class issuebookTableViewCell: UITableViewCell {
    @IBOutlet weak var rack_no: UILabel!
    
    @IBOutlet weak var status_lbl: UILabel!
    @IBOutlet weak var price_lbl: UILabel!
    @IBOutlet weak var category_lbl: UILabel!
    @IBOutlet weak var author_lbl: UILabel!
    
    @IBOutlet weak var issue_view: UIView!
    
    @IBOutlet weak var book_name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
