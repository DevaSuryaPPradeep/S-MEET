//
//  leaveapplicationViewController.swift
//  s-meet
//
//  Created by iroid on 16/03/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class leaveapplicationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //var cat = ["Onam","Annual","Casual"]
    @IBOutlet weak var tbl: UITableView!
    
    var dict = NSDictionary()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return l_array.count
        /* if leave_segment.selectedSegmentIndex == 0{
         return cat.count
         }
         else{
         return l_array.count
         }
         */
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.dict = self.l_array[indexPath.row]as! NSDictionary
        namedict = dict["studentname"] as! NSDictionary
        leavedict = dict["leave_categoryname"] as! NSDictionary
        
        
       
            let tcell = tableView.dequeueReusableCell(withIdentifier: "leaveapp")as!leaveapplicationTableViewCell
            self.dict = self.l_array[indexPath.row]as! NSDictionary
            
            
            if String(describing: self.dict["status"]!) == "0"{
                tcell.status_lbl.text = "Pending"
                tcell.status_lbl.backgroundColor = UIColor.orange
            }else if String(describing: self.dict["status"]!) == "1"{
                tcell.status_lbl.text = "approved"
                tcell.status_lbl.backgroundColor = UIColor.green
            }else{
                
                tcell.status_lbl.text = "Rejected"
                tcell.status_lbl.backgroundColor = UIColor.red
            }
            
            tcell.days_txt.text = String(describing: self.dict["leave_days"]!)
            tcell.reason_txtview.text = String(describing: self.dict["reason"]!)
            tcell.name_txt.text = String(describing: self.namedict["first_name"]!)
            
            
            tcell.applydate_txt.text = String(describing: self.dict["from_date"]!)
            let fdate = String(describing: self.dict["from_date"]!)
            let tdate = String(describing: self.dict["to_date"]!)
            tcell.applydate_txt.text = fdate + " - " + tdate
            
            
            
            let fname = String(describing: self.namedict["first_name"]!)
            let mname = String(describing: self.namedict["middle_name"]!)
            let lname = String(describing: self.namedict["last_name"]!)
            tcell.name_txt.text = fname + " " + mname + " " + lname
            tcell.annual_txt.text = String(describing: self.leavedict["name"]!)
            
            
            
            
            tcell.status_lbl.layer.cornerRadius = 8
            tcell.status_lbl.clipsToBounds = true
            tcell.leave_view.layer.cornerRadius = 20
            
            tcell.edit_btn.layer.cornerRadius = 8
            tcell.delete_btn.layer.cornerRadius = 8
            //tcell.browse_btn.layer.cornerRadius = 8
            
            
        
        return tcell
        /* else{
         var cat = ["Onam","Annual","Casual"]
         let tcell2 = tableView.dequeueReusableCell(withIdentifier: "leaves")as!assignedleaveTableViewCell
         tcell2.assignview.layer.cornerRadius = 8
         //tcell2.cat_lbl.text = cat[indexPath.row]
         return tcell2
         }*/
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 400
        }
    
    
    @IBAction func back_btn(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
   
    @IBAction func seg(_ sender: Any) {
        tbl.reloadData()
    }
    var jsondata = NSDictionary()
    var l_array = NSArray()
    var namedict = NSDictionary()
    var leavedict = NSDictionary()
    func leave(){
        let tokenvalue1 = UserDefaults.standard.string(forKey: "tokenvalue")
        
        let assignurl = URL(string: "http://iroidtechnologies.in/jeetmeet/api/student/leave/apply")
        var req = URLRequest(url: assignurl!)
        
        req.setValue("Bearer \(tokenvalue1!)", forHTTPHeaderField: "Authorization")
        
        req.httpMethod = "post"
        
        
        let task = URLSession.shared.dataTask(with: req){(data,response,error)in
            let mydata = data
            do{
                print("mydata-->",mydata!)
                do{
                
                    self.jsondata = try
                    JSONSerialization.jsonObject(with: mydata!,options: [])as!NSDictionary
                    
                   // self.dict = self.jsondata["data"]as!NSDictionary
                   self.l_array = self.jsondata["data"]as!NSArray
                    
                  print("assign..",self.l_array)
                  
                   
                    
                    
                     print("jsondata-->",self.jsondata)
                    
                    
                    
                    DispatchQueue.main.async {
                        self.tbl.reloadData()
                        
                    }
                    
                    
                }
            }
            catch{
                print("error",error.localizedDescription)
            }
        }
        task.resume()
        // Do any additional setup after loading the view.

    }
    @IBOutlet weak var add_btn: UIButton!
    @IBOutlet weak var leave_segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
leave()
        // Do any additional setup after loading the view.
       
        // Do any additional setup after loading the view.
    
      
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        leave_segment.setTitleTextAttributes(titleTextAttributes, for: .normal)
        leave_segment.setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        add_btn.layer.cornerRadius = 20
        
       
        
    }
    
    @IBAction func addleave_btn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "alert")
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
        
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
