//
//  SignUpResource.swift
//  Carbon
//
//  Created by Decagon on 26/08/2021.
//

import Foundation

struct signUpResource {
    
    func signUpUser(signUpRequest: SignUpRequest, completionHandler: @escaping (_ result: SignUpResponse?) -> Void) {
        
        let signUpURL = URL(string: ApiEndpoints.signUp)!
        let httpUtility = HTTPUtility()
        
        do {
            let signUpPostBody = try JSONEncoder().encode(signUpRequest)
            httpUtility.postAPIData(requestUrl: signUpURL, requestBody: signUpPostBody, resultType: SignUpResponse.self) { signUpAPIResponse in
                
                completionHandler(signUpAPIResponse)
            }
            
        } catch let error {
            debugPrint(error)
        }
    }
}
