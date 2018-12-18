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
    
    func getAllBidsForAticle(article: Article, row: Int, listener: tableProtocol) {

        db.collection("Aricles").document(article.getId()).collection("Bids")//
            .addSnapshotListener ({ (querySnapshot, err) in
                if err == nil {
                    var bidsArray = [Bod]()

                    for i in ((querySnapshot?.documents)!) {
                            let bid = i.data()["bid"]
                            let date = i.data()["date"]
                            let member = i.data()["memberId"]
                            
                        let bod = Bod(id: i.documentID, bid: bid as! Float, date: date as! Date, member: member as! String)
                        bidsArray.append(bod)
                        
                        
                    }
                    listener.bids(article: article, bids: bidsArray, row: row)
                }
                
        })
        

    }
    
    func getHoogsteBod(article: Article, listener: DetailProtocol) {
        db.collection("Aricles").document(article.getId()).collection("Bids").addSnapshotListener({ (QuerySnapshot, err) in
            if err == nil {
                var hoogste: Float = article.getMinBid()
                
                for i in ((QuerySnapshot?.documents)!) {
                    let bod = i.data()["bid"] as! Float
                    if(bod > hoogste) {
                        hoogste = i.data()["bid"] as! Float
                    }
                }
                listener.setHoogsteBod(bod: hoogste)
            }
        })
    }
    
    func addBod(article: Article, bod: Bod) {
        db.collection("Aricles").document(article.getId()).collection("Bids").addDocument(data: [
            "bid": bod.getBid(),
            "date": bod.getDate(),
            "memberId": bod.getMember()
            ])
        {
            err in
            
        }
    }
    
}
