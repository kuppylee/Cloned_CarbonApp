//
//  personalDetailModel.swift
//  Carbon
//
//  Created by Decagon on 25/08/2021.
//

import Foundation

struct LoginResponse: Decodable {

    let errorMessage: String?
    let data: LoginResponseData?
}

struct LoginResponseData: Decodable {
    let id: String
    let email: String
    let password: String

    enum CodingKeys: String, CodingKey {
        case password
        case id = "id"
        case email
    }
}
