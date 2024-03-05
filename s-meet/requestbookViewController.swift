//
//  requestbookViewController.swift
//  s-meet
//
//  Created by Netcom on 26/04/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class requestbookViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let ccell = tableView.dequeueReusableCell(withIdentifier: "request")as!requestbookTableViewCell
        self.jsondata = self.jsonarray[indexPath.row]as! NSDictionary
        
        if String(describing: self.jsondata["status"]!) == "0"{
            ccell.status_lbl.text = "Available"
            ccell.status_lbl.backgroundColor = UIColor.green
        }
        else{
            
            ccell.status_lbl.text = "Requested"
            ccell.status_lbl.backgroundColor = UIColor.orange
        }
        
        
        
        ccell.book_name.text = String(describing: self.jsondata["name"]!)
        ccell.author_name.text = String(describing: self.jsondata["author"]!)
        ccell.category.text = String(describing: self.jsondata["category"]!)
        ccell.price_lbl.text = String(describing: self.jsondata["price"]!)
        
        
        ccell.book_view.layer.cornerRadius = 10
        ccell.status_lbl.layer.cornerRadius = 8
        ccell.status_lbl.clipsToBounds = true
        ccell.request_btn.layer.cornerRadius = 8
        return ccell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
    var jsondata = NSDictionary()
   
    var jsonarray = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tokenvalue1 = UserDefaults.standard.string(forKey: "tokenvalue")
        
        let assignurl = URL(string: "https://iroidtechnologies.in/jeetmeet/api/student/request-books")
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
                       
                        self.request_tbl.reloadData()
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
    
    @IBOutlet weak var request_tbl: UITableView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
