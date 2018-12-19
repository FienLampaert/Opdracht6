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
    
    func getAllArticles(listener: tableProtocol) {
        db.collection("Aricles").addSnapshotListener( { (querySnapshot, err) in
            var articlesArray = [Article]()
            if(err == nil) {
                for i in (querySnapshot?.documents)! {
                    if (i.documentID != "rzuazrkmIf7HSzXsiCvb") {
                        // let desc = i.value(forKey: "Description")
                        // let value = i.value as? NSDictionary
                        let id = i.documentID
                        print(i.data())
                        let desc = i.data()["Description"] as! String
                        let b:CFNumber = i.data()["minBid"] as! CFNumber
                        var bidFloat: Float = 0
                        if CFNumberGetValue(b, CFNumberType.floatType, &bidFloat) {
                            bidFloat = Float(bidFloat)
                        } else {
                            bidFloat = 0
                        }
                        //let bids = i.data()["Bids"] as! [Bod]
                        let a = Article(id: id, description: desc ,minBid: bidFloat)
                        articlesArray.append(a)
                    }
                    listener.articles(articles: articlesArray)
                    }
                    
            }
        })
    }
}
