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

    var login: Login?
    var member = Member(id: "", username: "", password: "", birthdate: Date())
    
    
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var lblError: UILabel!
    
    @IBAction func btnAanmelden(_ sender: Any) {
        let email = txtEmail.text
        let wachtwoord = txtPassword.text
        var correct: Bool = false
        
        LoginValidation.validate(email: email ?? "", password: wachtwoord ?? "", listener: self)
    }
    
    func loginCompleted(login: Login?, error: String?) {
        lblError.text = error
        
        if(error == "Succesvol aangemeld") {
            if let l = login {
                let memberDAO = MemberDAO()
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "tableVC")
                //self.present(vc!, animated: true, completion: nil)
                self.navigationController?.pushViewController(vc!, animated: true)
                self.setLogin(login: login!)
                memberDAO.getMember(login: login!, listener: self)
            }
        }
        
    }
    
    func setLogin(login: Login) {
        self.login = login
    }
    
    func getLogin() -> Login {
        return login ?? Login(id: "", email: "",password: "")
    }
    
    func setMember(member: Member) {
        self.member = member
    }
    
    func getMemberName() -> String {
       
        return self.member.username
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

