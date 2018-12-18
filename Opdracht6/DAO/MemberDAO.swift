//
//  MemberDAO.swift
//  Opdracht6
//
//  Created by student on 29/11/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class MemberDAO {

    let db = Firestore.firestore()
    
    func getMember(login: Login, listener: RootVCProtocol){
        db.collection("Members").whereField("uid", isEqualTo: login.getId()).getDocuments { (QuerySnapshot, err) in
            for i in ((QuerySnapshot?.documents)!) {
                let id = i.data()["uid"]
                let name = i.data()["Name"]
                let birthdate = i.data()["birthDate"]
                let m = Member(id: id as! String, username: name as! String, password: "", birthdate: birthdate as! Date)
                listener.setMember(member: m)
            }
            
        }
    }
    
    func add(id: String, name: String, birthDate: Date) {
        db.collection("Members").addDocument(data: [
            "Name": name,
            "birthDate": birthDate,
            "uid": id
            ])
        {
            err in
            
        }
    }
}
