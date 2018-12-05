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
                            var ouderDan18 = 19
                            if(ouderDan18 >= 18) {
                                login = Login(email: email, password: password)
                                 createUser(login, listener)
                            }
                            else {
                                error = "Je moet ouder dan 18 jaar zijn."
                            }
                        }
                        else {
                            error = "Wachtwoord en wachtwoord bevestigen zijn niet gelijk aan elkaar."
                        }
                    }
                    else {
                        error = "Het wachtwoord bevestigen werd niet ingevuld."
                    }
                }
                else {
                    error = "Het wachtwoord werd niet ingevuld."
                }
            }
            else {
                error = "Het emailadres werd niet ingevuld."
            }
            
        }else {
            error = "De naam werd niet ingevuld."
        }
        
    }
    
    func createUser(login: Login, listener: RegistrationValidationProtocol) {
        
        let email = login.getEmail()
        let wachtwoord = login.getPassword()
        
        Auth.auth().createUser(withEmail: email, password: wachtwoord, completion: { (authResult, error) in
            
            listener.registrationCompleted(login: login, error: error)
            //return (authResult, error)
            
        })
        
        
        
    }
    
}

