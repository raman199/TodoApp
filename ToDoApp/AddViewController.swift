//
//  AddViewController.swift
//  ToDoApp
//
//  Created by mac on 2019-12-04.
//  Copyright © 2019 Centennial College. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore


class AddViewController: UIViewController {

    @IBOutlet weak var notes: UITextField!
    @IBOutlet weak var name: UITextField!
    var dict = [String:AnyObject]()
    
    var db:Firestore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func delt(_ sender: UIButton) {
    }
    
    
    @IBAction func add(_ sender: UIButton) {
        
        let Id = db?.collection("tasks").document().documentID
        
        let parameters = ["name":name.text!,"notes":notes.text!,"Id":Id!,"complete":false] as [String : Any]
        
        db?.collection("tasks").document(Id!).setData(parameters as [String : Any]){
            err in
            if let error = err{
                print(error.localizedDescription)
                
            }else{
               let alert = UIAlertController(title: "Message", message: "Task added", preferredStyle: .alert)
                let okay = UIAlertAction(title: "OK", style: .default, handler: { (action) in
             //       self.navigationController?.popViewController(animated: true)
                })
                alert.addAction(okay)
                self.present(alert, animated: true, completion: nil)
               // var mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainViewController") as! tableViewController
               // self.present(mainVC, animated: true, completion: nil)
            }
            
        }
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
