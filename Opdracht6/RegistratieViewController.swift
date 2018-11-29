//
//  RegistratieViewController.swift
//  Opdracht6
//
//  Created by student on 29/11/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import UIKit

class RegistratieViewController: UIViewController {
    let authUser = AuthenticationUser()
    
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtPasswordBevestig: UITextField!
    @IBOutlet var dteGeboortedatum: UIDatePicker!
    
    @IBAction func btnRegistreren (_ sender: Any) {
        let mail = txtEmail.text
        let wachtwoord = txtPassword.text
        
        dteGeboortedatum.datePickerMode = UIDatePicker.Mode.date
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy"
        var selectedDate = dateFormatter.string(from: dteGeboortedatum.date)
        
        //let geboortedatum = dteGeboortedatum.date
        
        if(mail != nil && wachtwoord != nil) {
            authUser.registreren(email: mail!, wachtwoord: wachtwoord!, geboortedatum: selectedDate)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}
