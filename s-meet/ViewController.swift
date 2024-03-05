//
//  ViewController.swift
//  s-meet
//
//  Created by iroid on 09/03/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var getdata = NSMutableData()
    var jsondata = NSDictionary()
    
    var iconClick = true
    var isSecureTextEntry = true
    
    @IBOutlet weak var login_btn: UIButton!
    @IBOutlet weak var password_txt: UITextField!
    @IBOutlet weak var username_txt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        login_btn.layer.cornerRadius = 10
        
        username_txt.attributedPlaceholder = NSAttributedString(string: "UserName", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        
        username_txt.layer.cornerRadius = 10.0
        username_txt.layer.borderWidth = 1.0
        username_txt.layer.borderColor = UIColor.black.cgColor
        
        
        
        password_txt.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        password_txt.layer.cornerRadius = 10.0
        password_txt.layer.borderWidth = 1.0
        password_txt.layer.borderColor = UIColor.black.cgColor
        
        
        
    }
    
    
    @IBAction func login_btn(_ sender: Any) {
        /*let m_storyboard = UIStoryboard(name: "Main", bundle: nil)
         let navi_view = m_storyboard.instantiateViewController(identifier: "navigate")as!newViewController
         self.navigationController?.pushViewController(navi_view, animated: true)*/
        
        
        
        
        let urll = URL(string: "http://iroidtechnologies.in/jeetmeet/api/student/login")
        var req = URLRequest(url: urll!)
        req.httpMethod = "post"
        let poststring = "username=\(username_txt.text!)&password=\(password_txt.text!)"
        print("poststring-->",poststring)
        req.httpBody = poststring.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: req){(data,requset,error)in
            
            if  let mydata = data{
                do
                {
                    print("mydata-->",mydata)
                    do{
                        self.getdata.append(mydata)
                        self.jsondata = try JSONSerialization.jsonObject(with: self.getdata as Data,options: [])as! NSDictionary
                        print("jsondata-->",self.jsondata)
                        UserDefaults.standard.set(self.jsondata["message"],forKey: "tokenvalue")
                        DispatchQueue.main.async {
                            let vc:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let log = vc.instantiateViewController(withIdentifier: "navigate")as!newViewController
                            self.navigationController?.pushViewController(log, animated: true)
                        }
                    }
                }
                catch{
                    print("error",error.localizedDescription)
                }
            }
        }
        
        task.resume()
        
    }
    
    
    @IBAction func password_btn(_ sender: Any) {
        
        let m_storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navi_view = m_storyboard.instantiateViewController(identifier: "password")as!forgotpasswordViewController
        self.navigationController?.pushViewController(navi_view, animated: true)
        
    }
    
    @IBAction func iconaction_btn(_ sender: Any) {
        password_txt.isSecureTextEntry.toggle()
        if password_txt.isSecureTextEntry {
            if let image = UIImage(named: "icons8-eye-24") {
                (sender as AnyObject).setImage(image, for: .normal)
            }
        } else {
            if let image = UIImage(named: "icons8-hide-24") {
                (sender as AnyObject).setImage(image, for: .normal)
            }
        }
        
        
    }
}
