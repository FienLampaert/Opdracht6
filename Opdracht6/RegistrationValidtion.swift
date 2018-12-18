//
//  AuthenticationUser.swift
//  Opdracht6
//
//  Created by student on 29/11/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation
import FirebaseAuth

class RegistrationValidation {
    
    /*
     func login(email: String, wachtwoord: String) -> Bool {
     return true
     }
     
     func registreren(email: String, wachtwoord: String, geboortedatum: String) {
     
     let memberDAO = MemberDAO()
     memberDAO.registreren(email: email, wachtwoord: wachtwoord, geboortedatum: geboortedatum)
     
     }
     */
    
    static func validate(name: String, email: String, password: String, passwordValidation: String, birthDate: Date, listener: RegistrationValidationProtocol){
        
        var error = ""
        var login: Login?
        
        if(!name.isEmpty ) {
            if(!email.isEmpty){
                if(!password.isEmpty){
                    if(!passwordValidation.isEmpty){
                        if(password == passwordValidation) {
                            var leeftijd = 19
                            if(leeftijd >= 18) {
                                login = Login(id: "", email: email, password: password)
                                self.createUser(login: login!, listener: listener)
                            }
                            else {
                                error = "Je moet ouder dan 18 jaar zijn."
                                listener.registrationCompleted(login: login, error: error)
                            }
                        }
                        else {
                            error = "Wachtwoord en wachtwoord bevestigen zijn niet gelijk aan elkaar."
                            listener.registrationCompleted(login: login, error: error)
                        }
                    }
                    else {
                        error = "Het wachtwoord bevestigen werd niet ingevuld."
                        listener.registrationCompleted(login: login, error: error)
                    }
                }
                else {
                    error = "Het wachtwoord werd niet ingevuld."
                    listener.registrationCompleted(login: login, error: error)
                }
            }
            else {
                error = "Het emailadres werd niet ingevuld."
                listener.registrationCompleted(login: login, error: error)
            }
            
        }else {
            error = "De naam werd niet ingevuld."
            listener.registrationCompleted(login: login, error: error)
        }
        
        
        
    }
    
    static func createUser(login: Login, listener: RegistrationValidationProtocol) {
        
        let email = login.getEmail()
        let wachtwoord = login.getPassword()
        
        Auth.auth().createUser(withEmail: email, password: wachtwoord) { (authResult, error) in
            
            if(error == nil) {
                login.setId(id: (authResult?.user.uid)!)
                 listener.registrationCompleted(login: login, error: "Succesvol geregistreerd")
            }
            else {
                 listener.registrationCompleted(login: login, error: error!.localizedDescription)
            }
           
            //return (authResult, error)
            
            guard let user = authResult?.user else { return }
        }
    }
    
}

