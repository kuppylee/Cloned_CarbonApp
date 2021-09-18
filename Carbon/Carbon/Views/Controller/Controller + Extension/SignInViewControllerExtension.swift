//
//  SignInViewControllerExtension.swift
//  Carbon
//
//  Created by Decagon on 26/08/2021.
//

import Foundation

extension SignInViewController: LoginViewModelDelegate {
    
    func didReceiveLoginResponse(loginResponse: LoginResponse?) {
        
        if (loginResponse?.errorMessage == nil && loginResponse?.data != nil) {
          let personalDetailsPage = PersonalDetailsViewController()
          self.navigationController?.pushViewController(personalDetailsPage, animated: true)
          
            
        } else if (loginResponse?.errorMessage != nil) {
            
            guard let errorMessage = loginResponse?.errorMessage else {
                return
            }
            let alert = AlertService.alert(with: Constants.ErrorAlertTitle,
                                           message: errorMessage,
                                           alertStyle: .alert)
            
            self.present(alert, animated: true)
        }
    }
}
