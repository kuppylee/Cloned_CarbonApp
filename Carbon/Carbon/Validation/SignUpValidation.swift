//
//  SignUpValidation.swift
//  Carbon
//
//  Created by Decagon on 26/08/2021.
//

import Foundation

struct SignUpValidation {
    
    func validate(SignUpRequest: SignUpRequest) -> ValidationResult {
        
      if (SignUpRequest.firstName!.isEmpty) {
            return ValidationResult(success: false, error: "First name required!")
        }
        
      if (SignUpRequest.middleName!.isEmpty) {
            return ValidationResult(success: false, error: "Middle name reqired")
        }
      
      if (SignUpRequest.lastName!.isEmpty){
        return ValidationResult(success: false, error: "Last name required")
      }
      
      if (SignUpRequest.email!.isEmpty){
        return ValidationResult(success: false, error: "Email is required")
      }
      
      if (SignUpRequest.password!.isEmpty) {
        return ValidationResult(success: false, error: "Password is required")
      }
      
      if (SignUpRequest.password?.count ?? 0 <= 7) {
        return ValidationResult(success: false, error: "Password should not be lesser \nthan 7 characters")
      }
      
      if (SignUpRequest.gender!.isEmpty){
        return ValidationResult(success: false, error: "Gender is required")
      }
      
      if (SignUpRequest.phoneNumber!.isEmpty){
        return ValidationResult(success: false, error: "Phone number is required")
      }
        return ValidationResult(success: true, error: nil)
    }
}


