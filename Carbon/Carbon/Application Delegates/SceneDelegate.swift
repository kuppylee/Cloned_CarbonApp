//
//  SceneDelegate.swift
//  Carbon
//
//  Created by Decagon on 23/08/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let windowScene = scene as? UIWindowScene else { return }
    
    let rootViewController = OnboardingViewController()
    
    let NavigationController = UINavigationController(rootViewController: rootViewController)
    
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    window?.rootViewController = NavigationController
    window?.makeKeyAndVisible()
   
  }
}
