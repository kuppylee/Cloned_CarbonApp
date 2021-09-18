//
//  SignUpResponse.swift
//  Carbon
//
//  Created by Decagon on 26/08/2021.
//

import Foundation

struct SignUpResponse: Decodable {

    var errorMessage: String?
    let data: LoginData?
}

struct LoginData: Decodable {
  let password: String
  let id: String
  let email: String

  enum CodingKeys: String, CodingKey {
      case password
      case id = "id"
      case email
  }
}
