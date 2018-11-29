//
//  MemberDAO.swift
//  Opdracht6
//
//  Created by student on 29/11/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation
import FirebaseAuth

class MemberDAO {
    //final FirebaseDatabase database = FirebaseDatabase.getInstance()
    //let db = Database.database().referenc()
    
    func registreren(email: String, wachtwoord: String, geboortedatum: String) {
        
        Auth.auth().createUser(withEmail: email, password: wachtwoord, completion: { (user, error) in
            var text: String
            if error != nil {
                text = "Error"
            }
            else {
                text = "Succesvol"
            }
            
        })
        
        
    }
}
