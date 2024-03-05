//
//  leaveformViewController.swift
//  s-meet
//
//  Created by iroid on 21/03/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit
//import iOSDropDown

class leaveformViewController: UIViewController {

    @IBOutlet weak var reason_txt: UITextField!
    @IBOutlet weak var endate_txt: UITextField!
    @IBOutlet weak var startdate_txt: UITextField!
//    @IBOutlet weak var category: DropDown!
    @IBOutlet weak var submit_btn: UIButton!
    
    @IBOutlet weak var starttime_txt: UITextField!
    
    @IBOutlet weak var endtime_txt: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        submit_btn.layer.cornerRadius = 25
//       category.optionArray = ["Casual Leave", "Onam","Annual"]
      
        
        startdate_txt.layer.borderColor = UIColor.lightGray.cgColor
        
        /*category.layer.cornerRadius = 10
        category.attributedPlaceholder = NSAttributedString(
        string: "    Category",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        startdate_txt.attributedPlaceholder = NSAttributedString(
        string: "    Starting Date",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        endate_txt.attributedPlaceholder = NSAttributedString(
        string: "    Ending Date",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        reason_txt.attributedPlaceholder = NSAttributedString(
        string: "    Reason",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])*/
        
        
        
        let blurFx = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurFxView = UIVisualEffectView(effect: blurFx)
        blurFxView.frame = view.bounds
        blurFxView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blurFxView, at: 0)
        
        
    }
    
    @IBAction func close_btn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
        
    }
    var jsondata = NSDictionary()
    var getdata = NSMutableData()
    @IBAction func submit_button(_ sender: Any) {
        
        
      /*  let tokenvalue1 = UserDefaults.standard.string(forKey: "tokenvalue")
        
        print("tokenvalue",tokenvalue1)
        let urll = URL(string: "https://iroidtechnologies.in/jeetmeet/api/student/leave/apply/save")
        
        var req = URLRequest(url: urll!)
        //req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        req.setValue("Bearer \(tokenvalue1!)", forHTTPHeaderField: "Authorization")
        
        req.httpMethod = "post"
        let poststring = "start_date=\(startdate_txt.text!)&end_date=\(endate_txt.text!)&start_time=\(starttime_txt.text!)&end_time=\(endtime_txt.text!)&leave_category=\(3)&reason=\(reason_txt.text!)&attachment=\("")"
        
        print("poststring-->",poststring)
        req.httpBody = poststring.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: req){(data,requset,error)in
            
            if  let mydata = data{
                do
                {
                    print("mydata-->",mydata)
                    do{
                        
                        self.jsondata = try JSONSerialization.jsonObject(with: self.getdata as Data,options: [])as! NSDictionary
                        print("jsondata-->",self.jsondata)
                        
                        DispatchQueue.main.async {
                            let vc:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let log = vc.instantiateViewController(withIdentifier: "leave")as!leaveapplicationViewController
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
       */
        print("Submitted Succesfully",jsondata)
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
