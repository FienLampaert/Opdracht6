//
//  Article.swift
//  Opdracht6
//
//  Created by student on 29/11/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation

class Article {
    var id: String
    var description: String
    var minBid: Float
    var bids: [Bod]
    
    init(id: String, description: String, minBid: Float){
        self.id = id
        self.description = description
        self.minBid = minBid
        self.bids = []
    }
    
    func getId() -> String {
        return self.id
    }
    
    func setId(id: String) {
        self.id = id
    }
    
    func getDescription() -> String {
        return self.description
    }
    
    func setDescription(desc: String) {
        self.description = desc
    }
    
    func getMinBid() -> Float {
        return self.minBid
    }
    
    func setMinBid(minBid: Float) {
        self.minBid = minBid
    }
    
    func getBids() -> [Bod] {
        return bids
    }
    
    func addBid(bid: Bod) {
        bids.append(bid)
    }
}
