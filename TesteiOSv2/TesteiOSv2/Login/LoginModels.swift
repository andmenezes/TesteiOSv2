//
//  LoginModels.swift
//  TesteiOSv2
//
//  Created by André Menezes on 09/03/20.
//  Copyright (c) 2020 André Menezes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
struct LoginResponse: Codable {
    var userAccount: User?
    var error: Error?
}

struct User: Codable {
    var userId: Int?
    var name: String?
    var bankAccount: String?
    var agency: String?
    var balance: Double?
}

struct Error: Codable {
    var code: Int?
    var message: String?
}


