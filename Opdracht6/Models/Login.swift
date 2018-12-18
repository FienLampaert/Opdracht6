//
//  Login.swift
//  Opdracht6
//
//  Created by student on 5/12/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation

class Login {
    var id: String = ""
    var email: String = ""
    var password: String = ""
    
    init(id: String, email: String, password: String) {
        self.id = id
        self.email = email
        self.password = password
    }
    
    func setId(id: String) {
        self.id = id
    }
    
    func getId() -> String {
        return id
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
