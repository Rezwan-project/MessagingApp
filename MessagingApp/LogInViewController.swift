//
//  ViewController.swift
//  MessagingApp
//
//  Created by user138037 on 5/24/18.
//  Copyright © 2018 Rezwan Inc. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func LogInPressed(_ sender: Any) {
        let messageListScreen = self.storyboard?.instantiateViewController(withIdentifier: "messageList")
        present(messageListScreen!, animated: true, completion: nil)
    }
    
}

