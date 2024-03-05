//
//  newViewController.swift
//  s-meet
//
//  Created by iroid on 10/03/23.
//  Copyright © 2023 iroid. All rights reserved.
//

import UIKit




class newViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var jsondata = NSDictionary()
    var dict = NSDictionary()
    var jsonArray = NSArray()
    var parendict = NSDictionary()
    var division = NSDictionary()
    var classdict = NSDictionary()
    
    
   var titles = ["Programming Contest","Parents Meeting","Annual Day","School Election","Arts Festival"]
    
    var desc = ["The international collegate programming contest is an algorithmic programming contest for college students.Teams of three,representing their university work to solve the most real-world problems,fostering collaboration ,creativity,innovation and the ability to perform under pressure.Through training and competition,teams challenge each other to raise the bar on the possible.Quite simply,it is the oldest,largest and most prestigious programmming contest in the world.","PTA addres issues that are important to parents and public school adminstrators.We fight for full funding,quality teachers and capabilities for schools to thrive.If your school or district does not have a PTA,now is the time.Membership is open to everyone.Your PTA is autonomous but supported by a national structure.It sets its own duties.","The annual school day celebration is organised by the management,students with great interest and enthusiasm.The day is celebrated during the first half of the academic session.It provides an oppurtunity to assess the achivements of the college.The students are actively assoicated in all the activities by themselves.As this day,falls right next to the sports day celebration,the energy the spirit of the students always stays high.  ","There are many elected roles available,with some requiring greater involvement than others.While societies and sports dubs host voluntary elected positions to run alongside your studies,the students union offers numerous paid,full-time sabbatical roles-such as president,vice-president,education officer and welfare officer that can be held for one or two years.","The school gives equal importance to academic and non academic areas.The school arts festival is conducted each year with unique names.In order to ensure the maximum participation from every student and to inculcate in them a spirit of competition,all the students are grouped into four houses.Each group is headed by respective teachers."]
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ncell = tableView.dequeueReusableCell(withIdentifier: "notice")as! noticeTableViewCell
        ncell.title_lbl.text = titles[indexPath.row]
        ncell.description_lbl.text = desc[indexPath.row]
        //ncell.notice_view.layer.cornerRadius = 30
        return ncell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let m_storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navi_view = m_storyboard.instantiateViewController(withIdentifier: "notification")as! notificationViewController
        navi_view.passtitle = titles[indexPath.row]
        navi_view.pass = desc[indexPath.row]
        self.navigationController?.pushViewController(navi_view, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    @IBOutlet weak var child_img: UIImageView!
    
    @IBOutlet weak var parentname_txt: UITextField!
    @IBOutlet weak var name_txt: UITextField!
    @IBOutlet weak var regno_txt: UITextField!
    @IBOutlet weak var division_txt: UITextField!
    @IBOutlet weak var dob_txt: UITextField!
    @IBOutlet weak var rollno_txt: UITextField!
    @IBOutlet weak var class_txt: UITextField!
    @IBOutlet weak var parent_img: UIImageView!
    @IBOutlet weak var profile_view: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        profile_view.layer.cornerRadius = 15
        
     //   let child_image = UIImage(named: "imageName")
        child_img.layer.borderWidth = 1.0
        child_img.layer.masksToBounds = false
        child_img.layer.borderColor = UIColor.white.cgColor
        child_img.layer.cornerRadius = child_img.frame.size.height / 2
        child_img.clipsToBounds = true
        
        
       // let parent_image = UIImage(named: "imageName")
        parent_img.layer.borderWidth = 2.0
        parent_img.layer.masksToBounds = false
        parent_img.layer.borderColor = UIColor.red.cgColor
        parent_img.layer.cornerRadius = parent_img.frame.size.height / 2
        parent_img.clipsToBounds = true
        
        
        notice_view.layer.cornerRadius = 20
        
       
        notice_view.layer.shadowColor = UIColor.darkGray.cgColor
        notice_view.layer.shadowOpacity = 1
        notice_view.layer.shadowOffset = CGSize.zero
        notice_view.layer.shadowRadius = 5
        self.view.addSubview(notice_view)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let tokenvalue1 = UserDefaults.standard.string(forKey: "tokenvalue")
     
               let profileurl=URL(string:"https://iroidtechnologies.in/jeetmeet/api/student/profile")
               var  preq=URLRequest(url: profileurl!)
            //   preq.httpMethod="GET"

             //  preq.addValue("application/json", forHTTPHeaderField: "Accept")
                   preq.setValue("Bearer \(tokenvalue1!)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: preq)
        {
            (data,request,error)in
       
            if let mydata = data
            {
                print("mydata-->",mydata)
                do
                {
                    self.jsondata = try
                    JSONSerialization.jsonObject(with: mydata,options: [])as!NSDictionary
                   self.jsonArray = self.jsondata["data"]as!NSArray
                    print("jsondata-->",self.jsondata)
                   self.dict = self.jsonArray[0]as!NSDictionary
                    
                    self.parendict = self.dict["parents"]as!NSDictionary
                    self.division = self.dict["divisions"]as!NSDictionary
                    self.classdict = self.dict["classname"]as!NSDictionary
                   
                    
                    do{
                        DispatchQueue.main.async { [self] in
                            self.class_txt.text = String(describing: self.classdict["name"]!)
                            
                            self.rollno_txt.text = String(describing: self.dict["roll_number"]!)
                            
                            self.dob_txt.text = String(describing: self.dict["dob"]!)
                            
                            self.division_txt.text = String(describing: self.division["name"]!)
                            
                            self.regno_txt.text = String(describing: self.dict["reg_number"]!)
                            
                            self.name_txt.text = String(describing: self.dict["first_name"]!)
                            
                            self.parentname_txt.text = String(describing: self.parendict["first_name"]!)
                            
                    let fname = String(describing: self.dict["first_name"]!)
                    let mname = String(describing: self.dict["middle_name"]!)
                    let lname = String(describing: self.dict["last_name"]!)
                    self.name_txt.text = fname + " " + mname + " " + lname
                            
                            UserDefaults.standard.setValue(self.name_txt.text, forKey: "name")
                    let pname = String(describing: self.parendict["first_name"]!)
                    let lastname = String(describing: self.parendict["last_name"]!)
                    self.parentname_txt.text = pname + " " + lastname
                            
                            
                        }
                    }
                }
                catch{
                    print("error",error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBOutlet weak var notice_view: UIView!
    
    
    
    }

