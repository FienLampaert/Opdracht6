//
//  Member.swift
//  Opdracht6
//
//  Created by student on 29/11/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation

class Member {
    var id: String = ""
    var username: String = ""
    var password: String = ""
    var birthdate: Date 
    
    init(id: String, username: String, password: String, birthdate: Date) {
        self.id = id
        self.username = username
        self.password = password
        self.birthdate = birthdate
    }
    
    func getUsername() -> String{
        return username
    }
    
    func setUsername(username: String) {
        self.username = username
    }
    
    func getPassword() -> String {
        return password
    }
    
    func setPassword(password: String) {
        self.password = password
    }
    
    func getBirthdate() -> Date {
        return birthdate
    }
    
    func setBirthdate(birthdate: Date) {
        self.birthdate = birthdate
    }
}
