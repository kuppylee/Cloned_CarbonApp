//
//  NewAccountViewController.swift
//  Carbon
//
//  Created by Decagon on 23/08/2021.
//
import UIKit

class NewAccountViewController: UIViewController {
  private var signUpViewModel = SignUpViewModel()
  
  private let welcomeText: UILabel = {
    let text = UILabel()
    text.translatesAutoresizingMaskIntoConstraints = false
    text.text = "Let's set things up. Please fill out these basic details \nto get started."
    text.font = UIFont(name: "Helvetica", size: 13)
    text.textAlignment = .center
    text.numberOfLines = 2
    return text
  }()
  
  private let firstName: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "First name"
    return label
  }()
  
  private let firstNameDetails: paddedTextField = {
    let textField = paddedTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    textField.layer.borderWidth = 1
    textField.layer.cornerRadius = 5
    textField.keyboardType = .emailAddress
    return textField
  }()
  
  private let middleName: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Middle name"
    return label
  }()
  
  private let middleNameDetails: paddedTextField = {
    let textField = paddedTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    textField.layer.borderWidth = 1
    textField.layer.cornerRadius = 5
    textField.keyboardType = .emailAddress
    return textField
  }()
  
  private let lastName: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Surname"
    return label
  }()
  
  private let lastNameDetails: paddedTextField = {
    let textField = paddedTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    textField.layer.borderWidth = 1
    textField.layer.cornerRadius = 5
    textField.keyboardType = .emailAddress
    return textField
  }()
  
  private let email: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Email"
    return label
  }()
  
  private let emailDetails: paddedTextField = {
    let textField = paddedTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    textField.layer.borderWidth = 1
    textField.layer.cornerRadius = 5
    textField.keyboardType = .emailAddress
    return textField
  }()
  
  private let password: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Password"
    return label
  }()
  
  private let passwordDetails: paddedTextField = {
    let textField = paddedTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    textField.layer.borderWidth = 1
    textField.layer.cornerRadius = 5
    textField.keyboardType = .emailAddress
    return textField
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    addDefaultViews()
    constraintViews()
    signUpViewModel.delegate = self
  }
  
  private let gender: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Gender"
    return label
  }()
  
  private let genderDetails: paddedTextField = {
    let textField = paddedTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    textField.layer.borderWidth = 1
    textField.layer.cornerRadius = 5
    textField.keyboardType = .emailAddress
    return textField
  }()
  
  private let phoneNumber: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Phone number"
    return label
  }()
  
  private let phoneNumberDetails: paddedTextField = {
    let textField = paddedTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    textField.layer.borderWidth = 1
    textField.layer.cornerRadius = 5
    textField.keyboardType = .numberPad
    return textField
  }()
  
  private let signUpButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Create account", for: .normal)
    button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    button.backgroundColor = UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00)
    button.addTarget(self, action: #selector(goToPersonalDetails), for: .touchUpInside)
    button.layer.cornerRadius = 10
    return button
  }()
  
  private let footerText: UILabel = {
    let text = UILabel()
    text.translatesAutoresizingMaskIntoConstraints = false
    text.text = "By continuing we accept our Terms of Service \n& Privacy Policy"
    text.font = UIFont(name: "Helvetica", size: 13)
    text.textAlignment = .center
    text.numberOfLines = 2
    return text
  }()
//   function go to personal details 
  @objc func goToPersonalDetails(_ sender: UIButton){
    let request = SignUpRequest(firstName: firstNameDetails.text, lastName: lastNameDetails.text, middleName: middleNameDetails.text, email: emailDetails.text, password: passwordDetails.text, gender: genderDetails.text, phoneNumber: phoneNumberDetails.text)
    signUpViewModel.signUpUser(signUpRequest: request)
  }
  
  func addDefaultViews() {
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    self.navigationItem.title = "Create your Carbon account"
    view.backgroundColor = .white
    
    view.addSubview(welcomeText)
    view.addSubview(firstName)
    view.addSubview(firstNameDetails)
    view.addSubview(middleName)
    view.addSubview(middleNameDetails)
    view.addSubview(lastName)
    view.addSubview(lastNameDetails)
    view.addSubview(email)
    view.addSubview(emailDetails)
    view.addSubview(password)
    view.addSubview(passwordDetails)
    view.addSubview(gender)
    view.addSubview(genderDetails)
    view.addSubview(phoneNumber)
    view.addSubview(phoneNumberDetails)
    view.addSubview(footerText)
    view.addSubview(signUpButton)
  }
  
  func constraintViews() {
    
    NSLayoutConstraint.activate([
      welcomeText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
      welcomeText.leftAnchor.constraint(equalTo: view.leftAnchor),
      welcomeText.rightAnchor.constraint(equalTo: view.rightAnchor),
      
      firstNameDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      firstNameDetails.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -7),
      firstNameDetails.heightAnchor.constraint(equalToConstant: 40),
      firstNameDetails.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 50),
      
      firstName.bottomAnchor.constraint(equalTo: firstNameDetails.topAnchor, constant: -10),
      firstName.leftAnchor.constraint(equalTo: firstNameDetails.leftAnchor),
      
      middleNameDetails.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 7),
      middleNameDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      middleNameDetails.heightAnchor.constraint(equalToConstant: 40),
      middleNameDetails.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 50),
      
      middleName.bottomAnchor.constraint(equalTo: middleNameDetails.topAnchor, constant: -10),
      middleName.leftAnchor.constraint(equalTo: middleNameDetails.leftAnchor),
      
      lastNameDetails.topAnchor.constraint(equalTo: firstNameDetails.bottomAnchor, constant: 40),
      lastNameDetails.heightAnchor.constraint(equalToConstant: 40),
      lastNameDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      lastNameDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      
      lastName.bottomAnchor.constraint(equalTo: lastNameDetails.topAnchor, constant: -10),
      lastName.leftAnchor.constraint(equalTo: lastNameDetails.leftAnchor),
      
      emailDetails.topAnchor.constraint(equalTo: lastNameDetails.bottomAnchor, constant: 40),
      emailDetails.heightAnchor.constraint(equalToConstant: 40),
      emailDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      emailDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      
      email.bottomAnchor.constraint(equalTo: emailDetails.topAnchor, constant: -10),
      email.leftAnchor.constraint(equalTo: emailDetails.leftAnchor),
      
      passwordDetails.topAnchor.constraint(equalTo: emailDetails.bottomAnchor, constant: 40),
      passwordDetails.heightAnchor.constraint(equalToConstant: 40),
      passwordDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      passwordDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      
      password.bottomAnchor.constraint(equalTo: passwordDetails.topAnchor, constant: -10),
      password.leftAnchor.constraint(equalTo: passwordDetails.leftAnchor),
      
      genderDetails.topAnchor.constraint(equalTo: passwordDetails.bottomAnchor, constant: 40),
      genderDetails.heightAnchor.constraint(equalToConstant: 40),
      genderDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      genderDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      
      gender.bottomAnchor.constraint(equalTo: genderDetails.topAnchor, constant: -10),
      gender.leftAnchor.constraint(equalTo: genderDetails.leftAnchor),
      
      phoneNumberDetails.topAnchor.constraint(equalTo: genderDetails.bottomAnchor, constant: 40),
      phoneNumberDetails.heightAnchor.constraint(equalToConstant: 40),
      phoneNumberDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      phoneNumberDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      
      phoneNumber.bottomAnchor.constraint(equalTo: phoneNumberDetails.topAnchor, constant: -10),
      phoneNumber.leftAnchor.constraint(equalTo: phoneNumberDetails.leftAnchor),
      
      footerText.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -5),
      footerText.leftAnchor.constraint(equalTo: view.leftAnchor),
      footerText.rightAnchor.constraint(equalTo: view.rightAnchor),
      
      signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
      signUpButton.heightAnchor.constraint(equalToConstant: 60),
      signUpButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      signUpButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
    ])
    
    
  }
  
  
  
}

