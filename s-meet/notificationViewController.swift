//
//  notificationViewController.swift
//  s-meet
//
//  Created by Netcom on 04/05/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class notificationViewController: UIViewController {

    @IBOutlet weak var notification_view: UIView!
    @IBOutlet weak var desc_txtview: UITextView!
    
    
    @IBOutlet weak var title_lbl: UILabel!
    var pass = String()
    var passtitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title_lbl.text = passtitle
        desc_txtview.text = pass
        
        notification_view.layer.cornerRadius = 20

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back_btn(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
