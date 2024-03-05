//
//  assignViewController.swift
//  s-meet
//
//  Created by Netcom on 24/04/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class assignViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignmentarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        
        let ccell = tableView.dequeueReusableCell(withIdentifier: "assign")as! assignTableViewCell
        self.dict = self.assignmentarray[indexPath.row]as!NSDictionary
      
        subjectdict = dict["subjectname"] as! NSDictionary
        classdict = dict["classname"] as! NSDictionary
        divisiondict = dict["divisionname"] as! NSDictionary
       
        
        print("dict....???",dict)
        
        ccell.cat_lbl.text = String(describing: self.dict["name"]!)
        ccell.date_lbl.text = String(describing: self.dict["deadline_date"]!)
        ccell.description_txtview.text = String(describing: self.dict["description"]!)
        ccell.subject_lbl.text = String(describing: self.subjectdict["name"]!)
        ccell.class_lbl.text = String(describing: self.classdict["name"]!)
        ccell.division_lbl.text = String(describing: self.divisiondict["name"]!)
     
        
        
        ccell.assign_view.layer.cornerRadius = 12
        
        
        
        
        
        return ccell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 430
        
    }
    
    @IBOutlet weak var assignment_tbl: UITableView!
    
    var yeardict = NSDictionary()
    var divisiondict = NSDictionary()
    var classdict = NSDictionary()
    var subjectdict = NSDictionary()
    var jsondata = NSDictionary()
    var jsonArray = NSArray()
    var dict = NSDictionary()
    var assignmentarray = NSArray()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tokenvalue1 = UserDefaults.standard.string(forKey: "tokenvalue")
        
        let assignurl = URL(string: "http://iroidtechnologies.in/jeetmeet/api/student/assignments")
        var req = URLRequest(url: assignurl!)
        
        req.setValue("Bearer \(tokenvalue1!)", forHTTPHeaderField: "Authorization")
        
        req.httpMethod = "post"
        
        
        let task = URLSession.shared.dataTask(with: req){(data,response,error)in
            let mydata = data
            do{
                print("mydata-->",mydata)
                do{
                
                    self.jsondata = try
                    JSONSerialization.jsonObject(with: mydata!,options: [])as!NSDictionary
                    
                    self.dict = self.jsondata["data"]as!NSDictionary
                    self.assignmentarray = self.dict["assignments"]as!NSArray
                    
                    print("assign..",self.assignmentarray)
                  
                   
                    
                    
                     print("jsondata-->",self.jsondata)
                    
                    
                    
                    DispatchQueue.main.async {
                        self.assignment_tbl.reloadData()
                        
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
    
    @IBAction func backbutton_btn(_ sender: Any) {
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
