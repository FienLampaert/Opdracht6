//
//  Article.swift
//  Opdracht6
//
//  Created by student on 29/11/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation

class Article {
    var description: String
    var minBid: Double
    var bids: [Bod]
    
    init(description: String, minBid: Double){
        self.description = description
        self.minBid = minBid
        self.bids = []
    }
    
    func getDescription() -> String {
        return self.description
    }
    
    func setDescription(desc: String) {
        self.description = desc
    }
    
    func getMinBid() -> Double {
        return self.minBid
    }
    
    func setMinBid(minBid: Double) {
        self.minBid = minBid
    }
    
    func getBids() -> [Bod] {
        return bids
    }
    
    func addBid(bid: Bod) {
        bids.append(bid)
    }
}
