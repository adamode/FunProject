//
//  FoodCell.swift
//  FoodMenuSwift
//
//  Created by Mohd Adam on 14/06/2017.
//  Copyright © 2017 Mohd Adam. All rights reserved.
//

import UIKit

//create custom delegate

protocol FoodCellDelegate {
    //what ever kind of function implement it here
    func didSelectFood(image: UIImage)
}

class FoodCell: UITableViewCell {
    
    var delegate : FoodCellDelegate?
    
    //to use the xib file so must call nib file 
    
    static let cellNib = UINib(nibName: FoodCell.cellIdentifier, bundle: Bundle.main)
    static let cellIdentifier = "FoodCell"
    
    @IBOutlet var imageViews: [UIImageView]!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        for imageView in imageViews {
            
            let tapGesture = UITapGestureRecognizer (target: self, action: #selector(didTapImageView(_:)))
            
            imageView.addGestureRecognizer(tapGesture)
            imageView.isUserInteractionEnabled = true
        }
    }
    
    func didTapImageView(_ gesture: UITapGestureRecognizer) {
        
        let imageView = gesture.view as! UIImageView
        
        //call the delegate to send the data
        delegate?.didSelectFood(image: imageView.image!)
        
    }
    
}
