//
//  examscheduleViewController.swift
//  s-meet
//
//  Created by Netcom on 25/04/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit

class examscheduleViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tcell = tableView.dequeueReusableCell(withIdentifier: "tests")as!examscheduleTableViewCell
        tcell.exam_view.layer.cornerRadius = 10
        tcell.exam_btn.layer.cornerRadius = 8
        return tcell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        date_txt.layer.cornerRadius = 8
        submit_btn.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    @IBOutlet weak var date_txt: UITextField!
    

    @IBOutlet weak var submit_btn: UIButton!
    
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
