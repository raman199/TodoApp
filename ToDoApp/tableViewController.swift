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

    
    @IBOutlet weak var tablee: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // db = Firestore.firestore()
        retrieveData()
    }
    func retrieveData(){
        
       db = Firestore.firestore()
        db?.collection("tasks").getDocuments(completion: { (snap, err) in
            
            for i in snap!.documents{
                self.dictionary.append(i.data() as [String : AnyObject])
                
            }
            print("dict is",self.dictionary)
            
            
        })
        self.tablee.reloadData()
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section:  Int) -> Int {
        return dictionary.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let index = dictionary[indexPath.row]
        print("index",index)
        
        if let x = cell.viewWithTag(1) as? UILabel{
            x.text = "dnnj"
        }
        
        
        if let y = cell.viewWithTag(2) as? UILabel{
            y.text = "dnnj"
        }
        
        return cell
    }
    
    
    
   
}
