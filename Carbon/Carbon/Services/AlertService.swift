//
//  AlertService.swift
//  Carbon
//
//  Created by Decagon on 26/08/2021.
//

import UIKit

struct AlertService {
        
    static func alert(with title: String,
                      message: String,
                      alertStyle: UIAlertController.Style) -> UIAlertController {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: alertStyle)
//      let alert2  = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
//      alert2.addAction(UIAlertAction(title: <#T##String?#>, style: <#T##UIAlertAction.Style#>, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>))

        alert.addAction(UIAlertAction(title: Constants.OkAlertTitle,
                                      style: .default,
                                      handler: nil))
        
        return alert
    }
}
