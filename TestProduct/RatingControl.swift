//
//  RatingControl.swift
//  TestProduct
//
//  Created by sashaIOS on 2/10/18.
//  Copyright © 2018 sashaIOS. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {

    private var ratingButtons = [UIButton]()
    private var rating = 0
    
    @IBInspectable var starSize:CGSize = CGSize(width: 44.0, height:44.0) {
        didSet{
            setupButtons()
        }
    }
    @IBInspectable var starCount:Int = 5 {
        didSet{
            setupButtons()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    
    private func setupButtons(){
        for but in ratingButtons {
            removeArrangedSubview(but)
            but.removeFromSuperview()
        }
        ratingButtons.removeAll()
        for _ in 0..<starCount {
            let button = UIButton()
            button.backgroundColor = UIColor.red
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
    }
    
    @objc func ratingButtonTapped(button: UIButton) {
        print("button tapped")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


}
