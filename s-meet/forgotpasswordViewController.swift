//
//  forgotpasswordViewController.swift
//  s-meet
//
//  Created by iroid on 20/03/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class forgotpasswordViewController: UIViewController {

    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var email_txt: UITextField!
    
    @IBOutlet weak var next_btn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        email_txt.layer.cornerRadius = 10
        email_txt.layer.borderWidth = 1.0
        email_txt.layer.borderColor = UIColor.darkGray.cgColor
        next_btn.layer.cornerRadius = 10
        
        
      email_txt.attributedPlaceholder = NSAttributedString(
            string: "        Enter Email or Phone Number",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
            )
            
        
    
    }
    
    @IBAction func back_button(_ sender: Any) {
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
