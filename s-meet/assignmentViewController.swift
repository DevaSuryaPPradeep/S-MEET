//
//  assignmentViewController.swift
//  s-meet
//
//  Created by iroid on 14/03/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit
import CoreData

class assignmentViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var diaryArray :[Diary] = []
    var cell = assignmentTableViewCell()
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ccell = tableView.dequeueReusableCell(withIdentifier: "assignment")as! assignmentTableViewCell
        ccell.num_lbl.text = "\(indexPath.row + 1)"
        ccell.assign_view.layer.cornerRadius = 10
        ccell.assign_view.layer.borderWidth = 4
        ccell.assign_view.layer.borderColor = UIColor.white.cgColor
        ccell.edit_btn.layer.cornerRadius = 6
        ccell.delete_btn.layer.cornerRadius = 6
        ccell.num_lbl.layer.cornerRadius = 8
        ccell.num_lbl.clipsToBounds = true
        let record = diaryArray[indexPath.row]
        ccell.note_lbl.text = record.note
        ccell.date_lbl.text = record.date
        return ccell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext
        if editingStyle == .delete
        {
            let std = diaryArray[indexPath.row]
            context.delete(std)
            (UIApplication.shared.delegate as!AppDelegate).saveContext()
            do
            {
                diaryArray = try context.fetch(Diary.fetchRequest())
            }
            catch
            {
                print("error")
            }
        }
        diary_tbl.reloadData()
    }
   
    @IBAction func bck_btn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
  
    @IBOutlet weak var diary_tbl: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func add_diary(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "adddiary")as!adddiaryViewController
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
        self.navigationController?.pushViewController(myAlert, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.fetchdata()
        self.diary_tbl.reloadData()
    }
  
    func fetchdata()
    {
        let context=(UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext
        do
        {
            diaryArray = try context.fetch(Diary.fetchRequest())
        }
        catch
        {
            print("error")
        }
    }
}
