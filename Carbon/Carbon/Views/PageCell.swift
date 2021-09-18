//
//  PageCell.swift
//  Carbon
//
//  Created by Decagon on 24/08/2021.
//

import UIKit
import Lottie

class PageCell: UICollectionViewCell {
  var page: PageModel?{
    
    didSet {
      guard let page = page else {return}
      
//      imageView.image = UIImage(named: page.imageName)
      
      let color = UIColor(white: 0.2, alpha: 1)
      
      //    to control the attribute of the title text
      let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold), NSAttributedString.Key.foregroundColor: color])
      
      //    to control the attribute of the message text
      attributedText.append(NSAttributedString(string: "\n\n\n\(page.message)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: color]))
      
      //    paragraph styling
      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.alignment = .center
      
      let length = attributedText.string.count
      attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
      
      textView.attributedText = attributedText
      
      
    }
  }
  
  
//  let imageView: UIImageView = {
//    let imageViewProperties = UIImageView()
//    imageViewProperties.contentMode = .scaleAspectFill
//    imageViewProperties.backgroundColor = .yellow
//    imageViewProperties.image = UIImage(named: "page1")
//    imageViewProperties.clipsToBounds = true
//    return imageViewProperties
//  }()
  
  let textView: UITextView = {
    let textViewProperties = UITextView()
    textViewProperties.text = "THIS IS A SAMPLE TEXT"
    textViewProperties.isEditable = false
    textViewProperties.textAlignment = .center
    textViewProperties.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
    return textViewProperties
  }()
  
  private var animationView: AnimationView!
  private func toShowLottieAnimation(){
    animationView = .init(name: "page1")
    animationView.frame = contentView.bounds
    animationView.contentMode = .scaleToFill
    animationView.loopMode = .loop
    animationView.animationSpeed = 0.5
    addSubview(animationView)
    
    animationView.play()
  }
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUpViews()
  }
  
  func setUpViews(){
//   addSubview(animationView)
    addSubview(textView)
    toShowLottieAnimation()
    
    // image view constraints
    animationView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
    
    //    textView constraints
    textView.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10)
    textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
