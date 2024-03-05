//
//  adddiaryViewController.swift
//  s-meet
//
//  Created by Netcom on 27/04/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit
import CoreData

class adddiaryViewController: UIViewController{
    
    @IBOutlet weak var submit_btn: UIButton!
    @IBOutlet weak var date_txt: UITextField!
    
    @IBOutlet weak var note_txtview: UITextView!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        date_txt.attributedPlaceholder = NSAttributedString(
            string: "    Enter Date",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        date_txt!.layer.borderWidth = 1
        date_txt!.layer.borderColor = UIColor.lightGray.cgColor  
        note_txtview!.layer.borderWidth = 1
        note_txtview!.layer.borderColor = UIColor.lightGray.cgColor
        submit_btn.layer.cornerRadius = 20
        
        
        let blurFx = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurFxView = UIVisualEffectView(effect: blurFx)
        blurFxView.frame = view.bounds
        blurFxView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blurFxView, at: 0)
        
        // Do any additional setup after loading the view.
    }
  
    @IBAction func submit_btn(_ sender: Any) {
        let  mydiary = NSEntityDescription.insertNewObject(forEntityName: "Diary", into: context)
        mydiary.setValue(self.date_txt.text, forKey: "date")
        mydiary.setValue(self.note_txtview.text, forKey: "note")
  
        do
        {
            try context.save()
            self.date_txt.text = ""
            self.note_txtview.text = ""
         //   self.dismiss(animated: true, completion: nil)
        }
        catch
        {
            print("error")
        }
    }

    @IBAction func close_btn(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "assign")as!assignmentViewController
        self.navigationController?.pushViewController(myAlert, animated: true)
    }
 
}
