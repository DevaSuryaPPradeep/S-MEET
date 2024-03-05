//
//  profileViewController.swift
//  s-meet
//
//  Created by iroid on 20/03/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {
    
    @IBOutlet weak var studentname_txt: UITextField!
    
    @IBOutlet weak var regno_txt: UITextField!
    
    @IBOutlet weak var parentname_txt: UITextField!
    
    @IBOutlet weak var gender_txt: UITextField!
    
    @IBOutlet weak var class_txt: UITextField!
    
    @IBOutlet weak var division_txt: UITextField!
    
    @IBOutlet weak var rollno_txt: UITextField!
    
    @IBOutlet weak var dob_txt: UITextField!
    
    @IBOutlet weak var phoneno_txt: UITextField!
    
    @IBOutlet weak var email_txt: UITextField!
    
    @IBOutlet weak var address_txt: UITextField!
    
    @IBOutlet weak var bloodgrp_txt: UITextField!
    
    @IBOutlet weak var place_txt: UITextField!
    
    @IBOutlet weak var state_txt: UITextField!
    
    @IBOutlet weak var country_txt: UITextField!
    
    @IBOutlet weak var nationality_txt: UITextField!
    
    
    
    @IBOutlet weak var parent_img: UIImageView!
    
    @IBOutlet weak var profile_img: UIImageView!
    
    @IBOutlet weak var parent_view: UIView!
    
    @IBOutlet weak var details1_view: UIView!
    
    
    @IBOutlet weak var details2_view: UIView!
    
    
    
    
    var jsondata = NSDictionary()
    var dict = NSDictionary()
    var jsonArray = NSArray()
    var classdict = NSDictionary()
    var divisiondict = NSDictionary()
    var countrydict = NSDictionary()
    var statedict = NSDictionary()
    var nationalitydict = NSDictionary()
    var parentdict = NSDictionary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let parent_image = UIImage(named: "imageName")
          parent_img.layer.borderWidth = 2.0
        parent_img.layer.masksToBounds = false
         parent_img.layer.borderColor = UIColor.red.cgColor
          parent_img.layer.cornerRadius = parent_img.frame.size.height / 2
          parent_img.clipsToBounds = true
        
        let profile_image = UIImage(named: "imageName")
          profile_img.layer.borderWidth = 4.0
        profile_img.layer.masksToBounds = false
         profile_img.layer.borderColor = UIColor.white.cgColor
        profile_img.layer.cornerRadius = profile_img.frame.size.height / 2
          profile_img.clipsToBounds = true
        
        
        parent_view.layer.cornerRadius = 35
        details1_view.layer.cornerRadius = 15
        details2_view.layer.cornerRadius = 15
        
        imgedit_btn.layer.cornerRadius = 11
        
       
       
        
    }
    
    @IBAction func back_button(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func namedit_btn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "name_edit")
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
  
   
    
    @IBOutlet weak var imgedit_btn: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        let tokenvalue1 = UserDefaults.standard.string(forKey: "tokenvalue")
        
        let detailurl = URL(string: "http://iroidtechnologies.in/jeetmeet/api/student/details")
        
        var req=URLRequest(url: detailurl!)
        
//        req.setValue("Bearer \(tokenvalue1!)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: req){(data,request,error)in
            if let mydata = data{
                print("mydata-->",mydata)
                do
                {
                    self.jsondata = try
                    JSONSerialization.jsonObject(with: mydata,options: [])as!NSDictionary
                    self.dict = self.jsondata["data"]as!NSDictionary
                    
                    self.classdict = self.dict["classname"]as!NSDictionary
                    self.divisiondict = self.dict["divisions"]as!NSDictionary
                    self.countrydict = self.dict["countries"]as!NSDictionary
                    self.statedict = self.dict["states"]as!NSDictionary
                    self.nationalitydict = self.dict["nationalities"]as!NSDictionary
                    self.parentdict = self.dict["parents"]as!NSDictionary
                    
                    
                    
                    print("jsondata-->",self.jsondata)
                   
                    do
                    {
                        DispatchQueue.main.async {
                            self.studentname_txt.text = String(describing: self.dict["first_name"]!)
                            
                            let fname = String(describing: self.dict["first_name"]!)
                            let mname = String(describing: self.dict["middle_name"]!)
                            let lname = String(describing: self.dict["last_name"]!)
                            self.studentname_txt.text = fname + " " + mname + " " + lname
                            
                            self.bloodgrp_txt.text = String(describing: self.dict["blood"]!)
                            
                            self.gender_txt.text = String(describing: self.dict["gender"]!)
                            
                            self.email_txt.text = String(describing: self.dict["email"]!)
                            
                            self.address_txt.text = String(describing: self.dict["address"]!)
                            
                            self.regno_txt.text = String(describing: self.dict["reg_number"]!)
                            
                            self.rollno_txt.text = String(describing: self.dict["roll_number"]!)
                            
                            self.dob_txt.text = String(describing: self.dict["dob"]!)
                            
                            self.phoneno_txt.text = String(describing: self.dict["phone"]!)
                            
                            self.place_txt.text = String(describing: self.dict["place"]!)
                            
                            self.class_txt.text = String(describing: self.classdict["name"]!)
                            
                            self.division_txt.text = String(describing: self.divisiondict["name"]!)
                            
                            self.country_txt.text = String(describing: self.countrydict["name"]!)
                            
                            self.state_txt.text = String(describing: self.statedict["name"]!)
                            
                            self.nationality_txt.text = String(describing: self.nationalitydict["name"]!)
                            
                            self.parentname_txt.text = String(describing: self.parentdict["first_name"]!)
                            
                    let pname = String(describing: self.parentdict["first_name"]!)
                    let lastname = String(describing: self.parentdict["last_name"]!)
                    self.parentname_txt.text = pname + " " + lastname
                            
                            
                            
                        }
                    }
                }
                catch
                {
                    print("error",error.localizedDescription)
                }
            }
        }
        task.resume()
        
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
