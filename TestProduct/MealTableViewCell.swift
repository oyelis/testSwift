//
//  MealTableViewCell.swift
//  TestProduct
//
//  Created by sashaIOS on 2/11/18.
//  Copyright © 2018 sashaIOS. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rating: RatingControl!
    @IBOutlet weak var displayView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
