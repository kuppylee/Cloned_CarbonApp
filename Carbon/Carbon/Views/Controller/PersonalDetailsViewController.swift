//
//  PersonalDetailsCountroller.swift
//  Carbon
//
//  Created by Decagon on 24/08/2021.
//

import UIKit
class PersonalDetailsViewController: UIViewController {
  
  // MARK:- Creating the logo
  let logo: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "carbon_image")
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  
  //MARK:- Creating the first name label
  private let firstName: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "First name"
    return label
  }()
  
  //MARK:- Creating the first name text field
  private let firstNameDetails: paddedTextField = {
    let textField = paddedTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    textField.layer.cornerRadius = 5
    textField.isUserInteractionEnabled = false
    return textField
  }()
  
  //MARK:- Creating the middle name label
  private let middleName: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Middle name"
    return label
  }()
  
  //MARK:- Creating the middle name text field
  private let middleNameDetails: paddedTextField  = {
    let textField = paddedTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    textField.layer.cornerRadius = 5
    textField.isUserInteractionEnabled = false
    return textField
  }()
  
  //MARK:- Creating the surname label
  private let surName: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Surname"
    return label
  }()
  
  //MARK:- Creating the surname text field
  private let surnameDetails: paddedTextField  = {
    let textField = paddedTextField ()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    textField.layer.cornerRadius = 5
    textField.isUserInteractionEnabled = false
    return textField
  }()
  
  //MARK:- Creating the email label
  private let email: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Email"
    return label
  }()
  
  //MARK:- Creating the email text field
  private let emailDetails: paddedTextField  = {
    let textField = paddedTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    textField.layer.cornerRadius = 5
    textField.isUserInteractionEnabled = false
    return textField
  }()
  
  //MARK:- Creating the password label
  private let password: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Password"
    return label
  }()
  
  //MARK:- Creating the password text field
  private let passwordDetails: paddedTextField  = {
    let textField = paddedTextField ()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    textField.layer.cornerRadius = 5
    textField.isUserInteractionEnabled = false
    return textField
  }()
  
  //MARK:- Creating the gender label
  private let gender: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Gender"
    return label
  }()
  
  //MARK:- Creating the gender text field
  private let genderDetails: paddedTextField  = {
    let textField = paddedTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    textField.layer.cornerRadius = 5
    textField.isUserInteractionEnabled = false
    return textField
  }()
  
  //MARK:- Creating the phone number label
  private let phoneNumber: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Phone number"
    return label
  }()
  
  //MARK:- Creating the phone number text field
  private let phoneNumberDetails: paddedTextField = {
    let textField = paddedTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    textField.layer.cornerRadius = 5
    textField.isUserInteractionEnabled = false
    return textField
  }()
  
  private let nextButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Next", for: .normal)
    button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    button.backgroundColor = UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00)
    //button.addTarget(self, action: #selector(goToPersonalDetails), for: .touchUpInside)
    button.layer.cornerRadius = 10
    return button
  }()
  
  //MARK:- Segue to personal details page
  @objc func goToPersonalDetails() {
    let personalController = PersonalDetailsViewController()
    navigationController?.pushViewController(personalController, animated: true)
  }
  
  //MARK:- View Did Load
  override func viewDidLoad() {
    super.viewDidLoad()
    addDefaultViews()
    constraintViews()
  }
  
  //MARK:- Adding Views
  func addDefaultViews() {
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    self.navigationItem.title = "Personal Details"
    view.backgroundColor = .white
    
    view.addSubview(logo)
    view.addSubview(firstName)
    view.addSubview(firstNameDetails)
    view.addSubview(middleName)
    view.addSubview(middleNameDetails)
    view.addSubview(surName)
    view.addSubview(surnameDetails)
    view.addSubview(email)
    view.addSubview(emailDetails)
    view.addSubview(password)
    view.addSubview(passwordDetails)
    view.addSubview(gender)
    view.addSubview(genderDetails)
    view.addSubview(phoneNumber)
    view.addSubview(phoneNumberDetails)
    view.addSubview(nextButton)
  }
  
  //MARK:- Constraining Views
  func constraintViews() {
    
    NSLayoutConstraint.activate([
      logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
      logo.heightAnchor.constraint(equalToConstant: 70),
      logo.widthAnchor.constraint(equalToConstant: 210),
      logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      firstNameDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      firstNameDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      firstNameDetails.heightAnchor.constraint(equalToConstant: 40),
      firstNameDetails.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20),
      
      firstName.bottomAnchor.constraint(equalTo: firstNameDetails.topAnchor, constant: -5),
      firstName.leftAnchor.constraint(equalTo: firstNameDetails.leftAnchor),
      
      middleNameDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      middleNameDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      middleNameDetails.heightAnchor.constraint(equalToConstant: 40),
      middleNameDetails.topAnchor.constraint(equalTo: firstNameDetails.bottomAnchor, constant: 40),
      
      middleName.bottomAnchor.constraint(equalTo: middleNameDetails.topAnchor, constant: -5),
      middleName.leftAnchor.constraint(equalTo: middleNameDetails.leftAnchor),
      
      surnameDetails.topAnchor.constraint(equalTo: middleNameDetails.bottomAnchor, constant: 40),
      surnameDetails.heightAnchor.constraint(equalToConstant: 40),
      surnameDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      surnameDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      
      surName.bottomAnchor.constraint(equalTo: surnameDetails.topAnchor, constant: -5),
      surName.leftAnchor.constraint(equalTo: surnameDetails.leftAnchor),
      
      emailDetails.topAnchor.constraint(equalTo: surnameDetails.bottomAnchor, constant: 40),
      emailDetails.heightAnchor.constraint(equalToConstant: 40),
      emailDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      emailDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      
      email.bottomAnchor.constraint(equalTo: emailDetails.topAnchor, constant: -5),
      email.leftAnchor.constraint(equalTo: emailDetails.leftAnchor),
      
      passwordDetails.topAnchor.constraint(equalTo: emailDetails.bottomAnchor, constant: 40),
      passwordDetails.heightAnchor.constraint(equalToConstant: 40),
      passwordDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      passwordDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      
      password.bottomAnchor.constraint(equalTo: passwordDetails.topAnchor, constant: -5),
      password.leftAnchor.constraint(equalTo: passwordDetails.leftAnchor),
      
      genderDetails.topAnchor.constraint(equalTo: passwordDetails.bottomAnchor, constant: 40),
      genderDetails.heightAnchor.constraint(equalToConstant: 40),
      genderDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      genderDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      
      gender.bottomAnchor.constraint(equalTo: genderDetails.topAnchor, constant: -5),
      gender.leftAnchor.constraint(equalTo: genderDetails.leftAnchor),
      
      phoneNumberDetails.topAnchor.constraint(equalTo: genderDetails.bottomAnchor, constant: 40),
      phoneNumberDetails.heightAnchor.constraint(equalToConstant: 40),
      phoneNumberDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      phoneNumberDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      
      phoneNumber.bottomAnchor.constraint(equalTo: phoneNumberDetails.topAnchor, constant: -5),
      phoneNumber.leftAnchor.constraint(equalTo: phoneNumberDetails.leftAnchor),
      
      nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
      nextButton.heightAnchor.constraint(equalToConstant: 60),
      nextButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
    ])
  }
}
