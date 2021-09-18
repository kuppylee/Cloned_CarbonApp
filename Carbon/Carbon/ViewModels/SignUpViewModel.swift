//
//  SignUpViewModel.swift
//  Carbon
//
//  Created by Decagon on 26/08/2021.
//

import Foundation
protocol signUpModelDelegate {
  func didReceiveSignUpResponse(signUpResponse: SignUpResponse?)
}

class SignUpViewModel {
  
  var delegate: signUpModelDelegate?
  
  func signUpUser(signUpRequest: SignUpRequest) {
    
    let validationResult = SignUpValidation().validate(SignUpRequest: signUpRequest)
    
    if (validationResult.success) {
      
      // Use loginResult to call Login API
      let signUpResource = signUpResource()
      signUpResource.signUpUser(signUpRequest: signUpRequest) { (signUpAPIResponse) in
        
        guard
          
          let userID = signUpAPIResponse?.data?.id else {
          return
        }
        
        UserDefaultUtility.saveUserID(userID: userID)
        
        DispatchQueue.main.async {
          self.delegate?.didReceiveSignUpResponse(signUpResponse: signUpAPIResponse)
        }
      }
    }
    
            self.delegate?.didReceiveSignUpResponse(signUpResponse:
                                                    SignUpResponse(errorMessage:
                                                                    validationResult.error,
                                                                  data: nil))
  }
}
