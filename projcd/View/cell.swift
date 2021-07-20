//
//  cell.swift
//  projcd
//
//  Created by Akshaya Kumar N on 11/23/19.
//  Copyright © 2019 Akshaya Kumar N. All rights reserved.
//

import UIKit

class cell: UITableViewCell {
    @IBOutlet weak var task: UILabel!
    
    @IBOutlet weak var priority: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
}
