//
//  AuthenticationUser.swift
//  Opdracht6
//
//  Created by student on 29/11/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation
import FirebaseAuth



class LoginValidation {

    static func validate(email: String, password: String, listener: LoginValidationProtocol){
        var error = ""
        var login: Login?
        
        if(!email.isEmpty) {
            if(!password.isEmpty){
                login = Login(id: "", email: email, password: password)
                self.signIn(login: login!, listener: listener)
            }
            else {
                error="Het wachtwoord werd niet ingevuld."
            }
        }
        else {
            error="Het emailadres werd niet ingevuld."
        }
        listener.loginCompleted(login: login, error: error)
    }
    
    static func signIn(login: Login, listener: LoginValidationProtocol){
        let email = login.getEmail()
        let wachtwoord = login.getPassword()
        
        Auth.auth().signIn(withEmail: email, password: wachtwoord) {(user, error) in
            if(error != nil){
                login.setId(id: (user?.user.uid)!)
                listener.loginCompleted(login: login, error: "Succesvol aangemeld")
            }
            else {
                listener.loginCompleted(login: login, error: error?.localizedDescription)
            }
    }
        
    }
    
}

