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
    //let regVal = RegistrationValidation()
    
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
        
        //print(dteGeboortedatum.date)
        
        let geboortedatum = dteGeboortedatum.date
        
        
        /*dteGeboortedatum.datePickerMode = UIDatePicker.Mode.date
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy"
        var selectedDate = dateFormatter.string(from: dteGeboortedatum.date)
 
        //let geboortedatum = dteGeboortedatum.date
        
        if(mail != nil && wachtwoord != nil) {
            authUser.registreren(email: mail!, wachtwoord: wachtwoord!, geboortedatum: selectedDate)
        }
 */
        RegistrationValidation.validate(name: name ?? "", email: mail ?? "", password: wachtwoord ?? "", passwordValidation: wachtwoordBevestiging ?? "", birthDate: geboortedatum, listener: self)
        
    }
    
    func registrationCompleted(login: Login?, error: String?) {
        lblError.text = error
        MemberDAO.createUser(login)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}
