//
//  ViewController.swift
//  Opdracht6
//
//  Created by student on 28/11/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, LoginValidationProtocol, RootVCProtocol {

    //let authUser = AuthenticationUser()
    var login: Login?
    
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var lblError: UILabel!
    
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
        
        LoginValidation.validate(email: email ?? "", password: wachtwoord ?? "", listener: self)
    }
    
    func loginCompleted(login: Login?, error: String?) {
        lblError.text = error
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tableVC")
        //self.present(vc!, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc!, animated: true)
        self.setLogin(login: login!)
    }
    
    func setLogin(login: Login) {
        self.login = login
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

