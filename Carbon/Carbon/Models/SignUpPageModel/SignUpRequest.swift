//
//  SignUpResponse.swift
//  Carbon
//
//  Created by Decagon on 26/08/2021.
//

import Foundation

struct SignUpRequest: Encodable {
  var firstName: String?
  var lastName: String?
  var middleName: String?
  var email: String?
  var password: String?
  var gender: String?
  var phoneNumber: String?
}
