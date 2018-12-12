//
//  tableProtocol.swift
//  Opdracht6
//
//  Created by student on 12/12/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

protocol tableProtocol {
    func articles(documentsArray: [QueryDocumentSnapshot] )
}
