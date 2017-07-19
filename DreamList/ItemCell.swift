//
//  ItemCell.swift
//  DreamList
//
//  Created by Andre Rosa on 18/07/17.
//  Copyright © 2017 Andre Rosa. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!
    
    
    func configureCell(item: Item){
        title.text = item.title
        price.text = "\(item.price)"
        details.text = item.details
    }
  
}
