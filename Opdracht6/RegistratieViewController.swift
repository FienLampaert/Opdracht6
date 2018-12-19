//
//  RegistratieViewController.swift
//  Opdracht6
//
//  Created by student on 29/11/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import UIKit



class RegistratieViewController: UIViewController, RegistrationValidationProtocol{
   
    let memberDAO = MemberDAO()

    @IBOutlet var txtNaam: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtPasswordBevestig: UITextField!
    @IBOutlet var dteGeboortedatum: UIDatePicker!
    @IBOutlet var lblError: UILabel!
    
    @IBAction func btnRegistreren (_ sender: Any) {
        let name = txtNaam.text
        let mail = txtEmail.text
        let wachtwoord = txtPassword.text
        let wachtwoordBevestiging = txtPasswordBevestig.text
        
        let memberDAO = MemberDAO()
        let geboortedatum = dteGeboortedatum.date
    
        RegistrationValidation.validate(name: name ?? "", email: mail ?? "", password: wachtwoord ?? "", passwordValidation: wachtwoordBevestiging ?? "", birthDate: geboortedatum, listener: self)
        
    }
    
    func registrationCompleted(login: Login?, member: Member?, error: String?) {
        lblError.text = error
        if (error == "Succesvol geregistreerd" ) {
            if let l = login {
                (self.navigationController?.viewControllers[0] as! ViewController).setLogin(login: login!)
                
                memberDAO.add(id: member!.id, name: member!.getUsername(), birthDate: member!.getBirthdate())
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}
