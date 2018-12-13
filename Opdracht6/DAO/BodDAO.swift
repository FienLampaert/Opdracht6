//
//  BodDAO.swift
//  Opdracht6
//
//  Created by student on 29/11/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class BodDAO {
    
    let db = Firestore.firestore()
    
    func getAllBidsForAticle(article: Article, listener: tableProtocol) {

        db.collection("Articles").whereField("ID", isEqualTo: article.getId())
            .getDocuments() { (querySnapshot, err) in
                if err != nil {
                    var bidsArray = [Bod]()

                    for i in ((querySnapshot?.documents)!) {
                            let bid = i.data()["bid"]
                            let date = i.data()["date"]
                            let member = i.data()["memberId"]
                            
                        let bod = Bod(bid: bid as! Float, date: date as! Date, member: member)
                        
                        listener.bids(bids: bidsArray)
                    }
                }
                
        }
        

    }
    
}
