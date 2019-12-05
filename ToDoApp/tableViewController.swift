//
//  tableViewController.swift
//  ToDoApp
//
//  Created by mac on 2019-12-02.
//  Copyright © 2019 Centennial College. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class tableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var db:Firestore?
    
    var dictionary = [[String:AnyObject]]()
    var arr = ["sdada","dasdasd"]
    var indexDict = [String:AnyObject]()
    
    @IBOutlet weak var tablee: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        retrieveData()
    }
    func retrieveData(){
        
       db = Firestore.firestore()
        db?.collection("tasks").getDocuments(completion: { (snap, err) in
            
            for i in snap!.documents{
                self.dictionary.append(i.data() as [String : AnyObject])
                
            }
            print("dict is",self.dictionary)
             self.tablee.reloadData()
            
        })
       
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section:  Int) -> Int {
        return dictionary.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let index = dictionary[indexPath.row]
        print("index",index)
        

        if let x = cell.viewWithTag(1) as? UILabel{
            x.text = index["name"] as? String
        }

        if let y = cell.viewWithTag(2) as? UILabel{
            y.text = index["notes"] as? String
        }
//
//
//        cell.textLabel?.text = index["name"] as? String
//        cell.detailTextLabel?.text = index["notes"] as? String
//
//
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexDict = dictionary[indexPath.row]
        self.performSegue(withIdentifier: "tasks", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tasks"{
            let vc = segue.destination as? AddViewController
            vc!.dict = indexDict
        }
    }
    
    
    
   
}
