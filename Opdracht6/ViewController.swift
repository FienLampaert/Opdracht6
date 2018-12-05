//
//  ViewController.swift
//  Opdracht6
//
//  Created by student on 28/11/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    //let authUser = AuthenticationUser()
    
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    @IBAction func btnAanmelden(_ sender: Any) {
        let email = txtEmail.text
        let wachtwoord = txtPassword.text
        var correct: Bool = false
        
        /*
        if(email != nil && wachtwoord != nil) {
            correct = authUser.login(email: email!, wachtwoord: wachtwoord!)
        }
        
        if(correct == true) {
            //self.navigationController?.pushViewController(UIViewController, animated: true)
        }
 */
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

