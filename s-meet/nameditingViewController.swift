//
//  nameditingViewController.swift
//  s-meet
//
//  Created by Netcom on 04/05/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class nameditingViewController: UIViewController {
    
    @IBOutlet weak var edit_view: UIView!
    
    @IBOutlet weak var savebutton: UIButton!
    
    @IBOutlet weak var fname_txt: UITextField!
    
    @IBOutlet weak var mname_txt: UITextField!
    
    @IBOutlet weak var lname_txt: UITextField!
    
    
    var getdata = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let blurFx = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurFxView = UIVisualEffectView(effect: blurFx)
        blurFxView.frame = view.bounds
        blurFxView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blurFxView, at: 0)
        
        edit_view.layer.cornerRadius = 25
        savebutton.layer.cornerRadius = 15
    }
    
    @IBAction func save_btn(_ sender: Any) {
        
        let tokenvalue1 = UserDefaults.standard.string(forKey: "tokenvalue")
        
        let url = URL(string: "https://iroidtechnologies.in/jeetmeet/api/student/profile/edit_name")
        
        
        var req = URLRequest(url: url!)
        
        req.setValue("Bearer \(tokenvalue1!)", forHTTPHeaderField: "Authorization")
        
       
        req.httpMethod = "post"
        
        let poststring = "first_name=\(fname_txt.text!)&middle_name=\(mname_txt.text!)&last_name=\(lname_txt.text!)"
        print("poststring-->",poststring)
        req.httpBody = poststring.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: req){(data,request,error)in
            
            let mydata = data
            
            do{
                print("mydata-->",mydata)
                do{
                    self.getdata.append(mydata!)
                    
                    let jsondata = try JSONSerialization.jsonObject(with: self.getdata as Data,options: [])
                    print("jsondata-->",jsondata)
                    
                    DispatchQueue.main.async {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
            catch{
                print("error",error.localizedDescription)
            }
        }
        task.resume()
    }
    
    @IBAction func close_btn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
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
