//
//  ViewController.swift
//  Carbon
//
//  Created by Decagon on 23/08/2021.
//

import UIKit
import Lottie

class OnboardingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
//    Skip button
  private let skipButton: UIButton = {

    let button = UIButton()
    button.setTitle("Skip", for: .normal)
    button.setTitleColor(UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00), for: .normal)
    button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
//    button.addTarget(self, action: #selector(didTapNewAccountButtonFromSkip) , for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  //  logo image view
  let logoImageView: UIImageView = {
    let logoImage = UIImageView()
    logoImage.contentMode = .scaleAspectFill
    logoImage.translatesAutoresizingMaskIntoConstraints = false
    logoImage.image = UIImage(named: "Carbon")
    return logoImage
    
  }()
  
  //  set up new account button
  private let newAccountButton: UIButton = {
    let button = UIButton()
    button.setTitle("Set up new account", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00)
    button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
    button.addTarget(self, action: #selector(didTapNewAccountButton) , for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  //  collectionView set up
  lazy var collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .white
    cv.delegate = self
    cv.dataSource = self
    cv.isPagingEnabled = true
    return cv
  }()
  
  //  collectionView data set up
  let cellID = "cellID"
  
  let pages: [PageModel] = {
    let firstPage = PageModel(title: "Go beyond banking", message: "Welcome to the future. Carbon is your\n passport to world-class financial services, \nbuilt just for you.", imageName: "page1")
    let secondPage = PageModel(title: "Stay on top of your finances. Anytime. Anywhere", message: "Carbon makes financial services faster,cheaper and more convenient. you can access the app 24/7, wherever you are.", imageName: "page2")
    let thirdPage = PageModel(title: "Trusted by millions", message: "With Carbon's market-leading service already used by millions of people just like you, you're in very good company.", imageName: "page3")
    
    return [firstPage, secondPage, thirdPage]
  }()
  
  //  OnboardingViewController view did load
  override func viewDidLoad() {
    super.viewDidLoad()
    doBasicSetUP()
    registerCells()
    view.backgroundColor = .white
    toLayoutCollectionView()
    
    
  }
  
  override func viewWillLayoutSubviews() {
    newAccountButton.layer.cornerRadius = 8
    
  }
  
  //  function to set up collection view
  func toLayoutCollectionView(){
    
    view.addSubview(collectionView)
    collectionView.anchorWithConstantsToTop(top: logoImageView.bottomAnchor, left: view.leftAnchor, bottom: newAccountButton.topAnchor, right: view.rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 16, rightConstant: 0)
  }
  
  //  function to set up scroll behaviour
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
    
    if pageNumber == 0{
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(didTapNewAccountButton))
      customizeBarButton()
    }
    if pageNumber != 0 {
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign in", style: .plain, target: self, action: #selector(didTapSignInButton))
      customizeBarButton()
    }
  }
  // function to customize bar button
  private func customizeBarButton(){
    self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00)
  }
  //  the selector functions
  @objc private func didTapSignInButton(_ sender: UIButton){
    let signInViewController = SignInViewController()
    navigationController?.pushViewController(signInViewController, animated: true)
  }
  
  @objc private func didTapNewAccountButton(_ sender: UIButton){
    // CODE TO THE ENTER THE PAGE TARGETED
    let newAccountViewController = NewAccountViewController()
    navigationController?.pushViewController(newAccountViewController, animated: true)
  }
  

  //  function to set up onboarding page objects
  private func doBasicSetUP(){
    
//    navigationItem.setRightBarButton(UIBarButtonItem(customView: skipButton), animated: true)
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(didTapNewAccountButton))
    view.addSubview(logoImageView)
    view.addSubview(newAccountButton)
    
    // set up newAccount button constraints
    NSLayoutConstraint.activate([
      newAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -16),
      newAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      newAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      newAccountButton.heightAnchor.constraint(equalToConstant: 55),
    ])
    
    //    set logo image constraint
    _ = logoImageView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 30, leftConstant: 80, bottomConstant: 0, rightConstant: 80, widthConstant: 0, heightConstant: 30)
    
  }
  
  // collectionView functions
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pages.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PageCell
    let page = pages[indexPath.item]
    cell.page = page
    return cell
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: view.frame.height)
  }
  
  //  function to register cells
  fileprivate func registerCells(){
    collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellID)
  }
}


