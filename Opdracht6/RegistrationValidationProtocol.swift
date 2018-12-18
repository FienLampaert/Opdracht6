//
//  RegistrationValidationProtocol.swift
//  Opdracht6
//
//  Created by student on 5/12/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation

protocol RegistrationValidationProtocol {
    func registrationCompleted(login: Login?, member: Member?, error: String?)
}
