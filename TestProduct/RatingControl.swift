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
    var rating = 0 {
        didSet{
            updateRating()
        }
    }
    
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
        let bundle = Bundle(for: type(of: self))
        let emptyStar = UIImage(named: "empty", in: bundle, compatibleWith: self.traitCollection)
        let filledStar = UIImage(named: "filled", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlighted", in: bundle, compatibleWith: self.traitCollection)
        
        for index in 0..<starCount {
            let button = UIButton()
            button.accessibilityLabel = "Set \(index + 1) star"
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.selected, .highlighted])
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
    }
    
    @objc func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("\(button) is not rating button")
        }
        let selectedRating = index + 1
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
        let hintString : String?
        if rating == index + 1 {
            hintString = "Tap to reset rating"
        } else{
            hintString = nil
        }
        let valueString : String
        switch rating {
        case 0:
            valueString = "No rating"
        case 1:
            valueString = "1 star set"
        default:
            valueString = "\(rating) stars set"
        }
        button.accessibilityValue = valueString
        button.accessibilityHint = hintString
    }
    
    func updateRating(){
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    
}
