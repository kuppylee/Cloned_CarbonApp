//
//  LoginValidation.swift
//  Carbon
//
//  Created by Decagon on 25/08/2021.
//

import Foundation

struct LoginValidation {
  
  func validate(loginRequest: LoginRequest) -> ValidationResult {
    let completeEmailValidation: String = "@"
    
    if (loginRequest.email!.isEmpty){
      return ValidationResult(success: false, error: "User email cannot be empty!")
    }
    
    if !(loginRequest.email!.contains(completeEmailValidation)) || !(loginRequest.email!.contains(".")){
      return ValidationResult(success: false, error: "User email format error!")
    }
    
    if (loginRequest.password!.isEmpty) {
      return ValidationResult(success: false, error: "User password is empty!")
    }
    
    if (loginRequest.password?.count ?? 0 <= 7) {
      return ValidationResult(success: false, error: "User password is not complete!")
    }
    
    
    return ValidationResult(success: true, error: nil)
  }
}
