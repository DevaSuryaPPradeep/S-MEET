//
//  timetableViewController.swift
//  s-meet
//
//  Created by iroid on 17/03/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class timetableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var tbl_view: UITableView!
    
    
    var monday_sub = ["English","chemistry","Maths","Physics","Malayalam"]
    var monday_teachers = ["Livya Thomas","Kevin K S","Lithin Joseph","K Sarath","Parvathy V"]
    
    var tuesday_sub = ["Malayalam","Biology","Social","Maths","Chemistry"]
    var tuesday_teachers = ["Parvathy V","Deepa K B","Sheena Chacko","Lithin Joseph","Kevin K S"]
    
    var wednesday_sub = ["English","Maths","Physics","Hindi","Biology"]
    var wednesday_teachers = ["Livya Thomas","Kevin K S","K Sarath","Sreeja Vinod","Deepa K B"]
    
    var thursday_sub = ["Malayalam","Social","Chemistry","Maths","Hindi"]
    var thursday_teachers = ["Parvathy V","Sheena Chacko","Kevin K S","Lithin Joseph","Sreeja Vinod"]
    
    var friday_sub = ["English","Physics","Biology","Social","Maths"]
    var friday_teachers = ["Livya Thomas","K Sarath","Deepa K B","Sheena Chacko","Lithin Joseph"]
    
    var start_time = ["9:30am","10:30am","11:10am","11:40am","12:10am"]
    var end_time = ["10:30am","11:00am","11:40am","12:10pm","12:40pm"]
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dcell = tableView.dequeueReusableCell(withIdentifier: "timetablereport")as! timetableTableViewCell
        dcell.view_1.layer.cornerRadius = 10
        dcell.view_2.layer.cornerRadius = 10
        dcell.num_lbl.text = "\(indexPath.row + 1)"
        
       
        
        if days_segment.selectedSegmentIndex == 0 {
            dcell.sub_lbl.text = monday_sub[indexPath.row]
            dcell.teacher_lbl.text = monday_teachers[indexPath.row]
            dcell.start_lbl.text = start_time[indexPath.row]
            dcell.end_lbl.text = end_time[indexPath.row]
           }
        
        
        else if days_segment.selectedSegmentIndex == 1 {
            dcell.sub_lbl.text = tuesday_sub[indexPath.row]
            dcell.teacher_lbl.text = tuesday_teachers[indexPath.row]
            dcell.start_lbl.text = start_time[indexPath.row]
            dcell.end_lbl.text = end_time[indexPath.row]
           }
        
        
        else if days_segment.selectedSegmentIndex == 2 {
            dcell.sub_lbl.text = wednesday_sub[indexPath.row]
            dcell.teacher_lbl.text = wednesday_teachers[indexPath.row]
            dcell.start_lbl.text = start_time[indexPath.row]
            dcell.end_lbl.text = end_time[indexPath.row]
           }
        
        
        else if days_segment.selectedSegmentIndex == 3 {
            dcell.sub_lbl.text = thursday_sub[indexPath.row]
            dcell.teacher_lbl.text = thursday_teachers[indexPath.row]
            dcell.start_lbl.text = start_time[indexPath.row]
            dcell.end_lbl.text = end_time[indexPath.row]
           }
        else
        {
            dcell.sub_lbl.text = friday_sub[indexPath.row]
            dcell.teacher_lbl.text = friday_teachers[indexPath.row]
            dcell.start_lbl.text = start_time[indexPath.row]
            dcell.end_lbl.text = end_time[indexPath.row]
           }
        
        
   
        
        return dcell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    @IBOutlet weak var days_segment: UISegmentedControl!
    
    @IBAction func day_seg(_ sender: Any) {
        tbl_view.reloadData()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        days_segment.setTitleTextAttributes(titleTextAttributes, for: .normal)
        days_segment.setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        
     
        
       /* let fontAttribute = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 12)!,
                             NSAttributedString.Key.foregroundColor: UIColor.red]

        days_segment.setTitleTextAttributes(fontAttribute, for: .normal)*/
    }
    
    @IBAction func back_btn(_ sender: Any) {
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
