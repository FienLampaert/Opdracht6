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
    
    static func validate(name: String, email: String, password: String, passwordValidation: String, birthDate: Date, listener: RegistrationValidationProtocol){
        
        var error = ""
        var login: Login?
        var member: Member?
        
        if(!name.isEmpty ) {
            if(!email.isEmpty){
                if(!password.isEmpty){
                    if(!passwordValidation.isEmpty){
                        if(password == passwordValidation) {
                            let leeftijd = (Calendar.current.dateComponents([.year], from: birthDate, to: Date())).year!
                            print(leeftijd)
                            if(leeftijd >= 18) {
                                
                                login = Login(id: "", email: email, password: password)
                                self.createUser(login: login!, username: name, birthdate: birthDate, listener: listener)
                            }
                            else {
                                error = "Je moet ouder dan 18 jaar zijn."
                                listener.registrationCompleted(login: login, member: (member ?? nil)!, error: error)
                            }
                        }
                        else {
                            error = "Wachtwoord en wachtwoord bevestigen zijn niet gelijk aan elkaar."
                            listener.registrationCompleted(login: login, member: member, error: error)
                        }
                    }
                    else {
                        error = "Het wachtwoord bevestigen werd niet ingevuld."
                        listener.registrationCompleted(login: login, member: member, error: error)
                    }
                }
                else {
                    error = "Het wachtwoord werd niet ingevuld."
                    listener.registrationCompleted(login: login, member: member, error: error)
                }
            }
            else {
                error = "Het emailadres werd niet ingevuld."
                listener.registrationCompleted(login: login, member: member, error: error)
            }
            
        }else {
            error = "De naam werd niet ingevuld."
            listener.registrationCompleted(login: login, member: member, error: error)
        }
        
        
        
    }
    
    static func createUser(login: Login, username: String, birthdate: Date, listener: RegistrationValidationProtocol) {
        
        let email = login.getEmail()
        let wachtwoord = login.getPassword()
        var member: Member?
        
        Auth.auth().createUser(withEmail: email, password: wachtwoord) { (authResult, error) in
            
            if(error == nil) {
                login.setId(id: (authResult?.user.uid)!)
                member = Member(id: (authResult?.user.uid)!, username: username, password: wachtwoord, birthdate: birthdate)
                listener.registrationCompleted(login: login, member: member, error: "Succesvol geregistreerd")
            }
            else {
                listener.registrationCompleted(login: login, member: member, error: error!.localizedDescription)
            }
           
            guard let user = authResult?.user else { return }
        }
    }
    
}

