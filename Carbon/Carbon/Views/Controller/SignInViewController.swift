//
//  SignInViewController.swift
//  Carbon
//
//  Created by Decagon on 24/08/2021.
//

import UIKit


class SignInViewController: UIViewController {
  private var loginViewModel = LoginViewModel()
  
  let textView: UITextView = {
    let tv = UITextView()
    tv.text = "SAMPLE TEXT FOR NOW"
    tv.isEditable = false
    tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
    return tv
  }()
  
  private let signInButton: UIButton = {
    let button = UIButton()
    button.setTitle("Sign in", for: .normal)
    button.backgroundColor = .purple
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
    button.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let welcomeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Hi there, welcome back , Please sign in"
    label.font = UIFont(name: "Helvetica", size: 16)
    return label
  }()
  
  private let emailLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Email"
    label.font = UIFont(name: "Helvetica", size: 14)
    return label
  }()
  
  private let passwordLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Password"
    label.font = UIFont(name: "Helvetica", size: 14)
    return label
  }()
  
  private let setUpNewAccountButton: UIButton = {
    let button = UIButton()
    button.setTitle("Set up new account", for: .normal)
    button.backgroundColor = .white
    button.setTitleColor(UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00), for: .normal)
    button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(didTapSetUpButton), for: .touchUpInside)
    return button
  }()
  
  private let newUserLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "New to Carbon?"
    return label
  }()
  
  
  private let emailTextField: paddedTextField = {
    let textField = paddedTextField()
    textField.placeholder = ""
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.layer.borderWidth = 0
    textField.keyboardType = .emailAddress
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.cornerRadius = 5
    textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    return textField
  }()
  
  private let passwordTextField: paddedTextField = {
    let textField = paddedTextField()
    textField.placeholder = ""
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.layer.borderWidth = 0
    textField.isSecureTextEntry = true
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.cornerRadius = 5
    textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    return textField
  }()
  
  let logoImageView : UIImageView = {
    let image =  UIImage(named: "Carbon")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  // MARK:- did Tap Button
  @objc func didTapSetUpButton(){
    let signInViewController = NewAccountViewController()
    navigationController?.pushViewController(signInViewController, animated: true)
  }
  @objc func didTapSignInButton(){
    let request = LoginRequest(email: emailTextField.text, password: passwordTextField.text)
    loginViewModel.loginUser(loginRequest: request)
  }
  
  override func viewWillLayoutSubviews() {
    signInButton.layer.cornerRadius = 8
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    layoutViews()
    loginViewModel.delegate = self
  }
  
  private func layoutViews() {
    view.addSubview(welcomeLabel)
    view.addSubview(signInButton)
    view.addSubview(logoImageView)
    view.addSubview(emailTextField)
    view.addSubview(passwordTextField)
    view.addSubview(emailLabel)
    view.addSubview(passwordLabel)
    view.addSubview(setUpNewAccountButton)
    view.addSubview(newUserLabel)
    
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    NSLayoutConstraint.activate([
      signInButton.heightAnchor.constraint(equalToConstant: 52),
      signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
      signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      
      logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
      logoImageView.heightAnchor.constraint(equalToConstant: 60),
      logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
      logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -100 ),
      logoImageView.heightAnchor.constraint(equalToConstant: 100),
      
      emailTextField.heightAnchor.constraint(equalToConstant: 52),
      emailTextField.bottomAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 126),
      emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      
      passwordTextField.heightAnchor.constraint(equalToConstant: 52),
      passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 6),
      passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      
      welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
      welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      emailLabel.bottomAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40),
      
      passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      passwordLabel.bottomAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 120),
      
      setUpNewAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -4),
      setUpNewAccountButton.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 2),
      
      newUserLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
      newUserLabel.rightAnchor.constraint(equalTo: view.centerXAnchor),
      
    ])
  }
  
  
}

class paddedTextField: UITextField {
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
  }
  
}
