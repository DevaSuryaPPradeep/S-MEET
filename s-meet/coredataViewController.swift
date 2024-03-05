//
//  coredataViewController.swift
//  s-meet
//
//  Created by Netcom on 02/05/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit
import CoreData


class coredataViewController: UIViewController {
    @IBOutlet weak var date_txt: UITextField!
    
    @IBOutlet weak var note_txt: UITextField!
    
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save_btn(_ sender: Any) {
        
        let  mydiary = NSEntityDescription.insertNewObject(forEntityName: "Diary", into: context)
        
        mydiary.setValue(self.note_txt.text, forKey: "note")
        mydiary.setValue(self.date_txt.text, forKey: "date")
        
        
        do
        {
            try context.save()
            self.note_txt.text = ""
            self.date_txt.text = ""
            
        }
        catch
        {
            print("error")
        }
    }
    @IBAction func display_btn(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "assign") as? assignmentViewController
        self.navigationController?.pushViewController(vc!, animated: true)

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
