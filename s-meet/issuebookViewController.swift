//
//  issuebookViewController.swift
//  s-meet
//
//  Created by Netcom on 18/05/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class issuebookViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ccell = tableView.dequeueReusableCell(withIdentifier: "issue")as! issuebookTableViewCell
        self.jsondata = self.jsonarray[indexPath.row]as! NSDictionary
        
        if String(describing: self.jsondata["status"]!) == "0"{
            ccell.status_lbl.text = "Available"
            ccell.status_lbl.backgroundColor = UIColor.green
        }
        else{
            
            ccell.status_lbl.text = "Requested"
            ccell.status_lbl.backgroundColor = UIColor.orange
        }
       
        
        
        
        self.jsondata = self.jsonarray[indexPath.row]as! NSDictionary
        ccell.issue_view.layer.cornerRadius = 10
        ccell.status_lbl.layer.cornerRadius = 8
        ccell.status_lbl.clipsToBounds = true
        ccell.book_name.text = String(describing: self.jsondata["name"]!)
        ccell.author_lbl.text = String(describing: self.jsondata["author"]!)
        ccell.price_lbl.text = String(describing: self.jsondata["price"]!)
        ccell.rack_no.text = String(describing: self.jsondata["rack"]!)
       
        return ccell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
    }
var jsondata = NSDictionary()
    var jsonarray = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tokenvalue1 = UserDefaults.standard.string(forKey: "tokenvalue")
        
        let assignurl = URL(string: "https://iroidtechnologies.in/jeetmeet/api/student/issued-books")
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
                    
                    
                    self.jsonarray = self.jsondata["data"]as!NSArray
                    
                    
                     print("jsondata-->",self.jsondata)
                    
                    
                    
                    DispatchQueue.main.async {
                       
                        self.issue_tbl.reloadData()
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
    
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var issue_tbl: UITableView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func back_btn(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}
