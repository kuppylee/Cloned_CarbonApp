//
//  UserDefaultUtility.swift
//  Carbon
//
//  Created by Decagon on 26/08/2021.
//

import Foundation

struct UserDefaultUtility {
  static func saveUserID(userID: String){
    UserDefaults.standard.setValue(userID, forKey: "userID")
  }
  static func getUserID() -> String {
    UserDefaults.standard.value(forKey: "userID") as! String
  }
}
