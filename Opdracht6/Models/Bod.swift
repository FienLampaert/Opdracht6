//
//  Bod.swift
//  Opdracht6
//
//  Created by student on 29/11/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation

class Bod {
    var id: String
    var bid: Float
    var date: Date
    var member: String
    
    init(id: String, bid: Float, date: Date, member: String){
        self.id = id
        self.bid = bid
        self.date = date
        self.member = member
    }
    
    func getId() -> String {
        return id
    }
    
    func setId(id: String) {
        self.id = id
    }
    
    func getBid() -> Float {
        return self.bid
    }
    
    func setBid(bid: Float) {
        self.bid = bid
    }
    
    func getDate() -> Date {
        return self.date
    }
    
    func setDate(date: Date) {
        self.date = date
    }
    
    func getMember() -> String {
        return self.member
    }
    
    func setMember(member: String) {
        self.member = member
    }
}
