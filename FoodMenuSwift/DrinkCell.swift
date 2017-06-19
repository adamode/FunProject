//
//  DrinkCell.swift
//  FoodMenuSwift
//
//  Created by Mohd Adam on 14/06/2017.
//  Copyright © 2017 Mohd Adam. All rights reserved.
//

import UIKit

protocol SelectDrinkDelegate {
    
    func didSelectDrink(image: UIImage)
}

class DrinkCell: UITableViewCell {
    
    var delegate : SelectDrinkDelegate?
    
    
    @IBOutlet var drinkImageViews: [UIImageView]!
    //1st register nib for xib file
    static let cellNib = UINib(nibName: DrinkCell.cellIdentifier, bundle: Bundle.main)
    static let cellIdentifier = "DrinkCell"

    override func awakeFromNib() {
        super.awakeFromNib()
//2nd whatever function needed to be done
        for drinkImage in drinkImageViews {
            
            let tapGesture = UITapGestureRecognizer (target: self, action: #selector(didTapDrinkView(_:)))
            
            drinkImage.addGestureRecognizer(tapGesture)
            drinkImage.isUserInteractionEnabled = true
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //3rd declare the function's function here
    func didTapDrinkView(_ gesture: UITapGestureRecognizer) {
        
        let drinkImage = gesture.view as! UIImageView
        
        //4th call the delegate to send the data
        
        delegate?.didSelectDrink(image: drinkImage.image!)
        
        
    }
    
}
