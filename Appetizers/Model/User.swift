//
//  User.swift
//  Appetizers
//
//  Created by Ernest Majewski on 23/12/2024.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapkins = false
    var frequestRefills = false
}
