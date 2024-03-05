//
//  staffdirectoryViewController.swift
//  s-meet
//
//  Created by iroid on 15/03/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class staffdirectoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
    var subjects = ["English","Malayalam","Maths","Physics","Chemistry","Biology","Social","Hindi"]
    var teachers = ["Livya Thomas","Parvathy V","Lithin Joseph","K Sarath","Kevin K S","Deepa K B","Sheena Chacko","Sreeja Vinod"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vcell = tableView.dequeueReusableCell(withIdentifier: "staff")as!staffdirectoryTableViewCell
        vcell.staff_view.layer.cornerRadius = 10
        vcell.staff_view.layer.borderWidth = 4
        vcell.staff_view.layer.borderColor = UIColor.white.cgColor
        vcell.layer.shadowOffset = CGSize(width: 0, height: 0)
        vcell.layer.shadowColor = UIColor.black.cgColor
        vcell.layer.shadowOpacity = 0.23
        vcell.layer.shadowRadius = 4
        vcell.sub_label.text = subjects[indexPath.row]
        vcell.teachers_label.text = teachers[indexPath.row]
        return vcell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back_button(_ sender: Any) {
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
