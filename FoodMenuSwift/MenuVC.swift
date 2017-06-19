//
//  MenuVC.swift
//  FoodMenuSwift
//
//  Created by Mohd Adam on 14/06/2017.
//  Copyright © 2017 Mohd Adam. All rights reserved.
//

import UIKit

//first declare datasource
class MenuVC: UIViewController,UITableViewDataSource, FoodCellDelegate, SelectDrinkDelegate {
    
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        
        //second set datasource to self
        tableView.dataSource = self
        //5th register the nib file here
        tableView.register(FoodCell.cellNib, forCellReuseIdentifier: FoodCell.cellIdentifier)
        tableView.register(DrinkCell.cellNib, forCellReuseIdentifier: DrinkCell.cellIdentifier)
        tableView.rowHeight = 150
        
    }
    
    //third called the function for tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if (indexPath.row == 1) {
        let foodCell : FoodCell = tableView .dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodCell

        //confom the delegate with the food cell
        foodCell.delegate = self;
        
            return foodCell
            
        } else {
            
            let drinkCell : DrinkCell = tableView .dequeueReusableCell(withIdentifier: "DrinkCell", for: indexPath) as! DrinkCell
            
            //confom the delegate with the food cell
            drinkCell.delegate = self;
            
            return drinkCell
        }
        
        
    }
    
    //this is to implement delegate into the main view controller
    func didSelectFood(image: UIImage) {
        
        foodImageView.image = image
    }
    
    //6th call the delegate
    func didSelectDrink(image: UIImage) {
        
        drinkImageView.image = image
    }
    
    

}
