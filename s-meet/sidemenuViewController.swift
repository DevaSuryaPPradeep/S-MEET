//
//  sidemenuViewController.swift
//  s-meet
//
//  Created by iroid on 13/03/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class sidemenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
   
    
    
    
    @IBOutlet weak var name_txt: UILabel!
    
    
    let sections = ["Personal","Academic","Library"]
    let items = [
                  ["My Diary","Profile","Leave Application","Staff Directory"],
                  ["Assignments","Subjects","Time Table","Events","Exam Schedule","Online Class"],
                  ["Request Book","Issue Book"]
                  ]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
       // return side_menu.count
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tcell = tableView.dequeueReusableCell(withIdentifier: "sidemenucell")as!sidemenuTableViewCell
       // tcell.lbl_1.text = side_menu[indexPath.row]
       // tcell.menu_imgview.image = UIImage(named: side_images[indexPath.row])
        tcell.textLabel?.text = items[indexPath.section][indexPath.row]
        return tcell
        
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
        
    }
   
    @IBOutlet weak var tbl_view: UITableView!
    
    @IBOutlet weak var pro_image: UIImageView!
    
    var jsondata = NSArray()
    var dict = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let profile_image = UIImage(named: "imageName")
        pro_image.layer.borderWidth = 4.0
        pro_image.layer.masksToBounds = false
        pro_image.layer.borderColor = UIColor.white.cgColor
        pro_image.layer.cornerRadius = pro_image.frame.size.height / 2
        pro_image.clipsToBounds = true
        
        
        tbl_view.delegate = self
        tbl_view.dataSource = self
        
        let username = UserDefaults.standard.string(forKey: "name")
        name_txt.text = username
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.red
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if items[indexPath.section][indexPath.row] == "My Diary" {
            let m_storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navi_view = m_storyboard.instantiateViewController(identifier: "assign")as!assignmentViewController
            self.navigationController?.pushViewController(navi_view, animated: true)
            
        }
        else if items[indexPath.section][indexPath.row] == "Profile" {
            let m_storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navi_view = m_storyboard.instantiateViewController(identifier: "profile")as!profileViewController
            self.navigationController?.pushViewController(navi_view, animated: true)
           
        }
        else if  items[indexPath.section][indexPath.row] == "Leave Application" {
            let m_storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navi_view = m_storyboard.instantiateViewController(identifier: "leave")as!leaveapplicationViewController
            self.navigationController?.pushViewController(navi_view, animated: true)
          
        }
        else if  items[indexPath.section][indexPath.row] == "Staff Directory" {
            let m_storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navi_view = m_storyboard.instantiateViewController(identifier: "staff")as!staffdirectoryViewController
            self.navigationController?.pushViewController(navi_view, animated: true)
            
        }
        
        else if items[indexPath.section][indexPath.row] == "Assignments" {
            let m_storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navi_view = m_storyboard.instantiateViewController(identifier: "tasks")as!assignViewController
            self.navigationController?.pushViewController(navi_view, animated: true)
        }
        else if items[indexPath.section][indexPath.row] == "Subjects" {
            let m_storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navi_view = m_storyboard.instantiateViewController(identifier: "subject")as!subjectViewController
            self.navigationController?.pushViewController(navi_view, animated: true)
            
        }
        else if items[indexPath.section][indexPath.row] == "Time Table" {
            let m_storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navi_view = m_storyboard.instantiateViewController(identifier: "timetable")as!timetableViewController
            self.navigationController?.pushViewController(navi_view, animated: true)
    
        }
        else if items[indexPath.section][indexPath.row] == "Events" {
            let m_storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navi_view = m_storyboard.instantiateViewController(identifier: "event")as!eventViewController
            self.navigationController?.pushViewController(navi_view, animated: true)
            
        }
        else if items[indexPath.section][indexPath.row] == "Exam Schedule" {
            let m_storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navi_view = m_storyboard.instantiateViewController(identifier: "exam")as!examscheduleViewController
            self.navigationController?.pushViewController(navi_view, animated: true)
            
        }
        else if items[indexPath.section][indexPath.row] == "Online Class" {
            let m_storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navi_view = m_storyboard.instantiateViewController(identifier: "profile")as!profileViewController
            //self.dict = self.jsondata[indexPath.row]as!NSDictionary
            self.navigationController?.pushViewController(navi_view, animated: true)
            
        }
        else if items[indexPath.section][indexPath.row] == "Request Book"{
            let m_storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navi_view = m_storyboard.instantiateViewController(identifier: "requestbook")as!requestbookViewController
            self.navigationController?.pushViewController(navi_view, animated: true)
            
        }
        else if items[indexPath.section][indexPath.row] == "Issue Book" {
            let m_storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navi_view = m_storyboard.instantiateViewController(identifier: "issuebook")as!issuebookViewController
           
            self.navigationController?.pushViewController(navi_view, animated: true)
            
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
}
