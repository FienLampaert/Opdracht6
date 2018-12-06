//
//  ArticleDAO.swift
//  Opdracht6
//
//  Created by student on 29/11/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class ArticleDAO {
    
    let db = Firestore.firestore()
    
    func getAllArticles() {
        db.collection("Articles").getDocument() { (querySnapshot, err) in
            
        }
    }
}
