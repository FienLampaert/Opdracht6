//
//  ArticleDAO.swift
//  Opdracht6
//
//  Created by student on 29/11/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation
import Firebase

class ArticleDAO {
    
    FirebaseApp.configure()
    
    let db = Firestroe.firestore()
    
    func getAllArticles() {
        db.collection("Articles").getDocument() { (querySnapshot, err) in
            
        }
    }
}
