//
//  subjectViewController.swift
//  s-meet
//
//  Created by Netcom on 17/05/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class subjectViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectarray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vcell = tableView.dequeueReusableCell(withIdentifier: "sub")as!subjectsTableViewCell
        self.jsondata = self.subjectarray[indexPath.row]as! NSDictionary
      
        
        
        
        vcell.subject_view.layer.cornerRadius = 10
        vcell.author_lbl.text =  String(describing: self.jsondata["author"]!)
        vcell.teacher.text = String(describing: self.jsondata["teachers"]!)
        vcell.pass_lbl.text = String(describing: self.jsondata["pass_mark"]!)
        vcell.final_lbl.text = String(describing: self.jsondata["total_mark"]!)
        vcell.code_lbl.text = String(describing: self.jsondata["subject_code"]!)
        vcell.subject_name.text = String(describing: self.jsondata["name"]!)
        
        
        
        return vcell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
var jsondata = NSDictionary()
    var dict = NSDictionary()
    var jsonarray = NSArray()
    var subjectarray = NSArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tokenvalue1 = UserDefaults.standard.string(forKey: "tokenvalue")
        
        let subjecturl = URL(string: "https://iroidtechnologies.in/jeetmeet/api/student/subjects")
        var req = URLRequest(url: subjecturl!)
        
        req.setValue("Bearer \(tokenvalue1!)", forHTTPHeaderField: "Authorization")
        
        req.httpMethod = "post"
        
        
        let task = URLSession.shared.dataTask(with: req){(data,response,error)in
            let mydata = data
            do{
                print("mydata-->",mydata)
                do{
                
                    self.jsondata = try
                    JSONSerialization.jsonObject(with: mydata!,options: [])as!NSDictionary
                    
                   
                    self.subjectarray = self.jsondata["subjects"]as!NSArray
                   
                    
                    
                  
                     print("jsondata-->",self.jsondata)
                    
                    
                    
                    DispatchQueue.main.async {
                        
                        self.subject_tbl.reloadData()
                    }
                    
                    
                }
            }
            catch{
                print("error",error.localizedDescription)
            }
        }
        task.resume()
        // Do any additional setup after loading the view.
    

        // Do any additional setup after loading the view.
    }
    @IBAction func back_btn(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    

    @IBOutlet weak var subject_tbl: UITableView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
