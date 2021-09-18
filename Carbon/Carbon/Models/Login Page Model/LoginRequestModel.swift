//
//  LoginRequestModel.swift
//  Carbon
//
//  Created by Decagon on 25/08/2021.
//

import Foundation

struct LoginRequest: Encodable {
    
    var email: String?
    var password: String?
}
