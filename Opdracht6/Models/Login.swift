//
//  Login.swift
//  Opdracht6
//
//  Created by student on 5/12/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation

class Login {
    var email: String = ""
    var password: String = ""
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    func setEmail(mail: String)  {
        self.email = mail
    }
    
    func setPassword(wachtwoord: String) {
        self.password = wachtwoord
    }
    
    func getEmail() -> String {
        return email
    }
    
    func getPassword() -> String {
        return password
    }
}
