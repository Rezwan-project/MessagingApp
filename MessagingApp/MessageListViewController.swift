//
//  MessageListViewController.swift
//  MessagingApp
//
//  Created by user138037 on 5/24/18.
//  Copyright © 2018 Rezwan Inc. All rights reserved.
//

import UIKit
import Firebase

class MessageListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var ref: DatabaseReference!
    var messages : [String] = []
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        TableView.delegate = self
        TableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        ref = Database.database().reference()
        
        ref.child("messages").observe(DataEventType.value, with: {(snapshot) in
           self.messages.removeAll()
            
            let dictionary = snapshot.value as? [String: Any]
            
            dictionary?.forEach({ (arg) in
                let(key, value) = arg
                self.messages.append(value as! String)
            })
            
            self.TableView.reloadData()
            
           
            
        })
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func AddButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func CloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell",for: indexPath)
        cell.textLabel?.text = messages[indexPath.row]
        return cell
    }
    
    
    
}
