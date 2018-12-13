//
//  Bod.swift
//  Opdracht6
//
//  Created by student on 29/11/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation

class Bod {
    var bid: Float
    var date: Date
    var member: Member
    
    init(bid: Float, date: Date, member: Member){
        self.bid = bid
        self.date = date
        self.member = member
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
    
    func getMember() -> Member {
        return self.member
    }
    
    func setMember(member: Member) {
        self.member = member
    }
}
